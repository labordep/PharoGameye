[![License](https://img.shields.io/github/license/labordep/PharoGameye.svg)](./LICENSE)

[![CI](https://github.com/labordep/PharoGameye/actions/workflows/CI.yml/badge.svg)](https://github.com/labordep/PharoGameye/actions/workflows/CI.yml)
[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 12](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://pharo.org/download)

# PharoGameye

![image](https://user-images.githubusercontent.com/49183340/224508985-aafac0c0-2247-4d01-8daa-6204033367dc.png)

GAMEYE.app collection mobile App model and tools for Pharo.

![image](https://user-images.githubusercontent.com/49183340/225460239-aa9b1bff-e7c0-41ed-a2c7-f2947dbeb2c0.png)

## Functionnalities

- Gameye App model : ```Collection```, ```VideoGame```, ```System```, ```Peripheral```, ```ToyToLife``` and ```PrintMedia```.
- Exported spreadsheet parsing (.csv) and ```Collection``` instanciation with owned list, wish list and for-sell list. All datas of the spreadsheet are readed for all types of ```Collectibles```.

A ```Collection``` is composed of ```Collectible``` which can be ```VideoGame```, ```System```, ```Peripheral```, etc.
Each ```Collectible``` have properties as Title, Type, Platform, etc.

**Note : This project works on GAMEYE v4.x, not already tested on v5.x.**

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

## Examples

To parse an existing exported spreadsheet file run ```GameyeExamples loadExportedSpreadsheet``` example.
This example use parsing methods to return three collections : 
- The "Owned" collection
- The "Wish List" collection 
- The "For Sell" collection

## About GAMEYE

[GAMEYE.app](https://gameye.app/) is a free applicaton to manage collecting from [Harrison Holzhauer](https://www.hdnastudio.com/), © 2016-2023 GAMEYE, INC.

[Gameye on AppStore](https://apps.apple.com/fr/app/gameye/id1105342771)

[Gameye on Google Play](https://play.google.com/store/apps/details?id=com.hairyharri.gameye&hl=fr&gl=US&pli=1)

## Licence

This project is a personal work, I'm not affilied with GAMEYE App.

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
