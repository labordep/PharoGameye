[![License](https://img.shields.io/github/license/labordep/PharoGameye.svg)](./LICENSE)

[![Tests](https://github.com/labordep/PharoGameye/actions/workflows/Tests.yml/badge.svg)](https://github.com/labordep/PharoGameye/actions/workflows/Tests.yml)
[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 12](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 13](https://img.shields.io/badge/Pharo-13-%23aac9ff.svg)](https://pharo.org/download)

[![GAMEYE.app v4](https://img.shields.io/badge/GAMEYE.app-v4-blue.svg)](https://gameye.app/)
[![GAMEYE.app v5](https://img.shields.io/badge/GAMEYE.app-v5-blue.svg)](https://gameye.app/)

# PharoGameye

![image](https://user-images.githubusercontent.com/49183340/224508985-aafac0c0-2247-4d01-8daa-6204033367dc.png)

GAMEYE.app collection mobile App model and tools for Pharo.

![image](https://github.com/labordep/PharoGameye/assets/49183340/b61ddd5a-8a14-405d-8a15-638c645d6e3b)

## Functionnalities

- Gameye App model : ```Collection```, ```VideoGame```, ```System```, ```Peripheral``` (with ```Controller``` and ```Accessory```), ```ToyToLife``` and ```PrintMedia```.
- Exported spreadsheet parsing (.csv) and ```Collection``` instanciation with owned list, wish list and for-sell list. All datas of the spreadsheet are readed for all types of ```Collectibles```.

A ```Collection``` is composed of ```Collectible``` which can be ```VideoGame```, ```System```, ```Peripheral```, etc.
Each ```Collectible``` have common properties as Title, Platform, etc. and specific properties as Developer, Publisher, etc.

## Installing

To install PharoGameye on [Pharo](https://pharo.org/) you can just execute the following script in your Pharo image:

```smalltalk
Metacello new
   baseline: 'Gameye';
   repository: 'github://labordep/PharoGameye:main';
	onConflictUseIncoming;
	ignoreImage;
   load.
```

## How to use it?

The class ```GameyeExamples``` provide a simple script to load an exported spreadsheet file.
Run ```GameyeExamples loadExportedSpreadsheet``` to test.

![image](https://github.com/labordep/PharoGameye/assets/49183340/182454b1-4f60-40d9-8e39-3cba2fcc63d1)

This example use parsing methods to return three collections : 
- The "Owned" collection
- The "Wish List" collection 
- The "For Sell" collection

![image](https://github.com/labordep/PharoGameye/assets/49183340/e94ad485-a50c-4a72-b1cd-b22b5b5ef515)

Then navigate into the model to inspect your collection using the Pharo UI.

![image](https://github.com/labordep/PharoGameye/assets/49183340/c0046401-56df-4c17-9ac1-04dc1d510611)

![image](https://github.com/labordep/PharoGameye/assets/49183340/efc8caf7-cd69-473b-bfc5-94c4741e0347)

## Tips

### How to get Collectibles with a database synchronization problem ?

Since v5 of GAMEYE application there is a country / region management. 

A problem can appears when GAMEYE application not recognize your collectible: each collectible is displayed with a "red title".

You need to fix each collectible by selected the good one in the list, but this is difficult to get all "red title" collectibles, especially on a big database.

![image](https://github.com/labordep/PharoGameye/assets/49183340/46efd417-f96a-439e-a0fa-dc6e75b23160)

A way to identify collectibles is to use this script on your collection :

```smalltalk
"get your collection manually with the sample file"
collection := GameyeCollectionFactory createOwnedCollectionFromExportedSpreadsheet: 'pharo-local\iceberg\labordep\PharoGameye\GameyeSpreadsheetSampleV5.csv' asFileReference.
games := collection videoGamesForCountry: nil. "here games are a list of games with potential problems, no one in the sample"
```

Or use ```GameyeExamples``` script to import into the Pharo UI :

![image](https://github.com/labordep/PharoGameye/assets/49183340/b0a9823b-2415-45fd-be2d-2c1f1c2f1f23)

![image](https://github.com/labordep/PharoGameye/assets/49183340/f5afd633-59e7-4735-9b3d-cda95c6d04d6)

Note : this problem was present in v4 but without way to identify wich collectibles are with a problem.

## About GAMEYE

[GAMEYE.app](https://gameye.app/) is a free applicaton to manage collecting from [Harrison Holzhauer](https://www.hdnastudio.com/), © 2016-2025 GAMEYE, INC.

[Gameye on AppStore](https://apps.apple.com/fr/app/gameye/id1105342771)

[Gameye on Google Play](https://play.google.com/store/apps/details?id=com.hairyharri.gameye&hl=fr&gl=US&pli=1)

## Licence

This project is a personal work, I'm not affilied with GAMEYE App.

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
