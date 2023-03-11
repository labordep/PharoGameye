# PharoGameye

![image](https://user-images.githubusercontent.com/49183340/224508985-aafac0c0-2247-4d01-8daa-6204033367dc.png)

GAMEYE.app tools for Pharo.

## Functionnalities

- Complete Gameye App model : ```Collection```, ```VideoGame```, ```System```, ```Peripheral```, ```ToyToLife``` and ```PrintMedia```.
- Exported spreadsheet parsing (.csv) for owned list, wish list and for sell list.

A ```Collection``` is composed of ```Collectible``` which can be ```VideoGame```, ```System```, ```Peripheral```, etc.
Each ```Collectible``` have properties as Title, Type, Platform, etc.

## Installing

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

GAMEYE is a free applicaton to manage collecting from [Harrison Holzhauer](https://www.hdnastudio.com/).


[Official Gameye website](https://gameye.app)

[Gameye on AppStore](https://apps.apple.com/fr/app/gameye/id1105342771)

[Gameye on Google Play](https://play.google.com/store/apps/details?id=com.hairyharri.gameye&hl=fr&gl=US&pli=1)

## Licence

This project is a personnal work, I'm not affilied with GAMEYE App.

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
