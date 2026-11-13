# richerDesktopCompagnon

Installeur de [MateEngine](https://github.com/shinyflvre/Mate-Engine) avec une sélection de danses et de modèles VRM.

## ⚠️ Avertissement

Aucun des fichiers de danses, de modèles (`vrm\`) ou de l'application MateEngine distribués ou téléchargés par ce dépôt n'appartient à son auteur. Il s'agit d'une sélection de travaux de divers créateurs tiers (voir [Origine des modèles](#origine-des-modèles) et [Origine des danses](#origine-des-danses) ci-dessous).

**Aucun fichier de ce dépôt n'est autorisé à être utilisé à des fins commerciales, violentes, NSFW (sexuellement explicites), ou à être redistribué**, quelles que soient les permissions indiquées par ailleurs sur la page d'origine d'un modèle ou d'une danse. Pour un usage allant au-delà d'un usage personnel, se référer à la licence propre de chaque œuvre et contacter son auteur.

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

## Origine des modèles

Titre, auteur et lien tels qu'embarqués dans les métadonnées de chaque fichier `.vrm`. Le lien pointe vers la page de l'auteur ou vers la licence [VRoid Hub](https://hub.vroid.com/) choisie à la publication (détail des autorisations : usage commercial, modification, redistribution, expression violente/sexuelle, etc.) quand aucun lien direct vers le modèle n'est disponible.

| Fichier | Titre | Auteur | Lien |
|---|---|---|---|
| `1003769096094080734.vrm` | 棒人間2 | 厨二王国 | [Twitter](https://twitter.com/ChuuniKingdom) · [Booth](https://chuunikingdom.booth.pm/) · [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=allow&credit=unnecessary&modification=allow&personal_commercial_use=profit&redistribution=disallow&sexual_expression=allow&version=1&violent_expression=allow) |
| `2132588702468785528.vrm` | [CHR01]cosplayMikuMiku'ed(feat.Vocaloid) | ttasa | [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=disallow&credit=unnecessary&modification=allow&personal_commercial_use=nonprofit&redistribution=allow&sexual_expression=allow&version=1&violent_expression=allow) |
| `3216544759728402116.vrm` | [V02]cosplayMagurona(feat.魔王マグロナ) | ttasa | [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=disallow&credit=unnecessary&modification=allow&personal_commercial_use=nonprofit&redistribution=allow&sexual_expression=allow&version=1&violent_expression=allow) |
| `324483548758431872.vrm` | フォティス | yukimushi | [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=disallow&credit=unnecessary&modification=allow&personal_commercial_use=disallow&redistribution=disallow&sexual_expression=allow&version=1&violent_expression=allow) |
| `4595860508024406802.vrm` | 時髦的未來 | 6 | [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=allow&credit=unnecessary&modification=allow&personal_commercial_use=profit&redistribution=allow&sexual_expression=allow&version=1&violent_expression=allow) |
| `5769707762041790947.vrm` | DTM220305-W | AtsukoMMX | [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=disallow&credit=unnecessary&modification=allow&personal_commercial_use=profit&redistribution=disallow&sexual_expression=allow&version=1&violent_expression=allow) |
| `6675908704043784191.vrm` | [CHRx1]ElsieEstuary_hoodiestyle | ttasa_respect.itako | [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=disallow&credit=unnecessary&modification=allow&personal_commercial_use=nonprofit&redistribution=allow&sexual_expression=allow&version=1&violent_expression=allow) |
| `6845903312732933063.vrm` | Lilith | NOFAL | [Profil VRoid Hub](https://hub.vroid.com/en/users/122911298) · [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=allow&credit=unnecessary&modification=allow&personal_commercial_use=profit&redistribution=disallow&sexual_expression=disallow&version=1&violent_expression=allow) |
| `800075275183789109.vrm` | フルリール 1.3 | クリア | [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=disallow&credit=unnecessary&modification=disallow&personal_commercial_use=disallow&redistribution=disallow&sexual_expression=disallow&version=1&violent_expression=disallow) |
| `8154280126425666501.vrm` | Arlecchino Form | BhPlayZ | Telegram `@BhPlayZ` · [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=disallow&credit=unnecessary&modification=allow&personal_commercial_use=disallow&redistribution=allow&sexual_expression=disallow&version=1&violent_expression=disallow) |
| `8590192545620301703.vrm` | ジャッロ＝イエロー＝マスタードイエロー | 悪霊ティラ | Twitter `@s_zerer` · [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=allow&credit=unnecessary&modification=allow&personal_commercial_use=profit&redistribution=disallow&sexual_expression=allow&version=1&violent_expression=allow) |
| `8755100585825430042.vrm` | 【Free model】dress style | 白い白米 | [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=allow&credit=unnecessary&modification=allow&personal_commercial_use=profit&redistribution=allow&sexual_expression=allow&version=1&violent_expression=allow) |
| `8756611596255805093.vrm` | AI-2 | runa | [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=allow&credit=unnecessary&modification=allow&personal_commercial_use=profit&redistribution=disallow&sexual_expression=allow&version=1&violent_expression=allow) |
| `8781825009908935922.vrm` | *(sans titre)* | Original PocketPair, modifié par JustaPal | Non issu de VRoid Hub — modèle basé sur un asset [Palworld](https://www.pocketpair.jp/palworld) (PocketPair), modifié par JustaPal, licence CC BY |
| `8934651228003028345.vrm` | 恵美子 (Emiko) | ｋｆｍ | [Licence](https://hub.vroid.com/license?allowed_to_use_user=everyone&characterization_allowed_user=everyone&corporate_commercial_use=disallow&credit=unnecessary&modification=allow&personal_commercial_use=disallow&redistribution=allow&sexual_expression=disallow&version=1&violent_expression=allow) |

## Origine des danses

Les fichiers de `dances\` proviennent de ce [dossier Google Drive](https://drive.google.com/drive/folders/1YU7-Hz-O8-9B2E58mxQxexJTBTCT42jr), une compilation communautaire de danses MMD converties pour MateEngine. Les auteurs originaux des chorégraphies et des conversions ne sont pas tous identifiés individuellement ; voir l'avertissement en tête de ce document.
