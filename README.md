# richerDesktopCompagnon

Installeur de [MateEngine](https://github.com/shinyflvre/Mate-Engine) avec une sélection de danses et de modèles VRM.

## Installation

Télécharger `install.bat` et `install.ps1` depuis la [dernière release](https://github.com/ReLoutre/richerDesktopCompagnon/releases/latest) (ou cloner le dépôt), les placer dans le dossier d'installation souhaité, puis double-cliquer sur `install.bat`.

Le script :
1. télécharge les danses (`dances\`) et les modèles (`vrm\`) depuis la release de ce dépôt ;
2. télécharge la dernière release de MateEngine dans `MateEngine\` ;
3. place dans le dossier `CustomDances` de l'application un lien (jonction NTFS, sans copie) vers `dances\`.

Lancer ensuite `MateEngine\MateEngineX.exe`.
Relancer le script met à jour l'application (les danses ne sont retéléchargées que si la release change) ; la configuration, stockée dans `%USERPROFILE%\AppData\LocalLow\Shinymoon`, est conservée.

## Tailles

| Élément | Téléchargement | Sur le disque |
|---|---|---|
| Danses (`dances\`) | 3,4 Go | 3,3 Go |
| Modèles (`vrm\`) | 0,2 Go | 0,4 Go |
| MateEngine (`MateEngine\`) | 0,8 Go | 1,5 Go |
| Modèle d'IA, téléchargé par l'application au premier lancement | 1,9 Go | 1,9 Go |
| **Total** | **≈ 6,3 Go** | **≈ 7,1 Go** |

Prévoir environ 2,5 Go libres supplémentaires pendant l'installation (archives temporaires, supprimées à la fin).

> Les danses occupent à elles seules 3,3 Go. Pour libérer de la place, le contenu de `dances\` (ou certains de ses sous-dossiers) peut être supprimé sans risque ; garder le dossier `dances\` lui-même, même vide, pour que le script ne retélécharge pas les danses.

## Charger les modèles (première fois)

1. Clic droit sur le modèle affiché sur le bureau.
2. Cliquer sur l'icône d'engrenages.
3. Pour chaque modèle à charger : cliquer en bas sur **VRM/ME**, puis sélectionner le fichier `.vrm` dans `vrm\`.

> **Note :** dans la configuration générale, section **Movement**, l'option **Husbando** adapte les animations aux modèles masculins. Elle est désactivée par défaut.
