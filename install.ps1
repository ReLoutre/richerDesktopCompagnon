﻿# Installe (ou met à jour) MateEngine avec les danses et modèles de richerDesktopCompagnon :
#   1. télécharge les danses et modèles VRM depuis la dernière release de ce dépôt (dances\, vrm\) ;
#   2. télécharge la dernière release de MateEngine depuis GitHub (MateEngine\) ;
#   3. place dans le dossier CustomDances de l'application une jonction NTFS vers dances\.
#
# Usage : .\install.ps1 [-InstallDir <dossier>] [-SkipContent]
#   -SkipContent : ne pas (re)télécharger les danses et modèles.

param(
    [string]$InstallDir = (Join-Path $PSScriptRoot 'MateEngine'),
    [switch]$SkipContent
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'   # Invoke-WebRequest est très lent avec la barre de progression
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Add-Type -AssemblyName System.IO.Compression.FileSystem

$appRepo     = 'shinyflvre/Mate-Engine'
$contentRepo = 'ReLoutre/richerDesktopCompagnon'
$headers     = @{ 'User-Agent' = 'richerDesktopCompagnon-installer' }
$dancesDir   = Join-Path $PSScriptRoot 'dances'
$versionFile = Join-Path $PSScriptRoot '.content_version'
$tmpRoot     = Join-Path ([IO.Path]::GetTempPath()) ('mateengine_' + [guid]::NewGuid().ToString('N'))

function Get-LatestRelease([string]$repo) {
    Invoke-RestMethod -Uri "https://api.github.com/repos/$repo/releases/latest" -Headers $headers
}

function Save-Asset($asset) {
    $path = Join-Path $tmpRoot $asset.name
    Write-Host ("  Téléchargement de {0} ({1:N0} Mo)..." -f $asset.name, ($asset.size / 1MB))
    Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $path -UseBasicParsing -Headers $headers
    $path
}

# Extrait une archive en écrasant les fichiers existants (ExtractToDirectory ne sait pas écraser en PowerShell 5.1).
function Expand-ZipOverwrite([string]$zipPath, [string]$destination) {
    $zip = [IO.Compression.ZipFile]::OpenRead($zipPath)
    try {
        foreach ($entry in $zip.Entries) {
            $target = Join-Path $destination $entry.FullName
            if ($entry.FullName.EndsWith('/')) { New-Item -ItemType Directory -Path $target -Force | Out-Null; continue }
            New-Item -ItemType Directory -Path (Split-Path $target) -Force | Out-Null
            [IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $target, $true)
        }
    } finally { $zip.Dispose() }
}

try {
    New-Item -ItemType Directory -Path $tmpRoot | Out-Null

    # ===================================================================
    # 1. Danses et modèles VRM (assets de la release de ce dépôt)
    # ===================================================================
    if (-not $SkipContent) {
        Write-Host "Recherche de la dernière release de $contentRepo..."
        $content = Get-LatestRelease $contentRepo
        $installed = if (Test-Path $versionFile) { (Get-Content $versionFile -Raw).Trim() } else { '' }
        if ($installed -eq $content.tag_name -and (Test-Path $dancesDir)) {
            Write-Host "Danses et modèles déjà à jour ($installed)."
        } else {
            Write-Host "Installation des danses et modèles $($content.tag_name)..."
            foreach ($asset in $content.assets | Where-Object { $_.name -like 'dances-*.zip' -or $_.name -eq 'vrm.zip' }) {
                $zip = Save-Asset $asset
                # dances-*.zip contient un dossier de danses ; vrm.zip contient le dossier vrm.
                $dest = if ($asset.name -eq 'vrm.zip') { $PSScriptRoot } else { $dancesDir }
                New-Item -ItemType Directory -Path $dest -Force | Out-Null
                Expand-ZipOverwrite $zip $dest
                Remove-Item $zip
            }
            Set-Content -Path $versionFile -Value $content.tag_name
        }
    }

    # ===================================================================
    # 2. Application MateEngine
    # ===================================================================
    Write-Host "Recherche de la dernière release de $appRepo..."
    $release = Get-LatestRelease $appRepo
    $asset = $release.assets | Where-Object { $_.name -like '*.zip' } | Select-Object -First 1
    if (-not $asset) { throw "Aucune archive .zip trouvée dans la release $($release.tag_name) de $appRepo." }
    $zipPath = Save-Asset $asset

    Write-Host "Extraction..."
    $extractDir = Join-Path $tmpRoot 'extract'
    [IO.Compression.ZipFile]::ExtractToDirectory($zipPath, $extractDir)
    Remove-Item $zipPath
    # L'archive peut contenir un dossier racine : on cherche celui qui contient le dossier *_Data.
    $dataDir = Get-ChildItem -Path $extractDir -Directory -Recurse -Filter '*_Data' | Select-Object -First 1
    if (-not $dataDir) { throw "Dossier *_Data introuvable dans l'archive." }
    $appRoot = $dataDir.Parent.FullName
    $newStreaming = Join-Path $appRoot (Join-Path $dataDir.Name 'StreamingAssets')

    # Remplace l'installation précédente (la config utilisateur est dans AppData\LocalLow).
    if (Test-Path $InstallDir) {
        Write-Host "Remplacement de l'installation précédente : $InstallDir"
        # Retire d'abord les jonctions (sans toucher à leur cible) : Remove-Item -Recurse
        # de PowerShell 5.1 les traverserait et effacerait le dossier 'dances'.
        Get-ChildItem -Path $InstallDir -Directory -Recurse -Attributes ReparsePoint -ErrorAction SilentlyContinue |
            ForEach-Object { [IO.Directory]::Delete($_.FullName, $false) }
        # Conserve le modèle LLM (~2 Go) téléchargé par l'application au démarrage, pour éviter de le retélécharger.
        Get-ChildItem -Path $InstallDir -Filter '*.gguf' -Recurse -File -ErrorAction SilentlyContinue |
            Where-Object { $_.Directory.Name -eq 'StreamingAssets' } |
            ForEach-Object { Write-Host "  Conservation de $($_.Name)"; Move-Item $_.FullName $newStreaming -Force }
        Remove-Item -Path $InstallDir -Recurse -Force
    }
    Move-Item -Path $appRoot -Destination $InstallDir

    # ===================================================================
    # 3. Jonction vers les danses dans CustomDances (scanné récursivement)
    # ===================================================================
    $customDances = Join-Path $InstallDir (Join-Path $dataDir.Name 'StreamingAssets\CustomDances')
    $danceLink    = Join-Path $customDances 'richerDesktopCompagnon'
    if (Test-Path $dancesDir) {
        New-Item -ItemType Directory -Path $customDances -Force | Out-Null
        New-Item -ItemType Junction -Path $danceLink -Target (Resolve-Path $dancesDir).Path | Out-Null
        Write-Host "Jonction créée : $danceLink -> $dancesDir"
    } else {
        Write-Warning "Dossier 'dances' introuvable, aucune danse liée."
    }

    $exe = Get-ChildItem -Path $InstallDir -Filter '*.exe' | Where-Object { $_.Name -notlike 'UnityCrashHandler*' } | Select-Object -First 1
    Write-Host ""
    Write-Host "Installation terminée. Lancer : $($exe.FullName)" -ForegroundColor Green
}
finally {
    if (Test-Path $tmpRoot) { Remove-Item -Path $tmpRoot -Recurse -Force -ErrorAction SilentlyContinue }
}
