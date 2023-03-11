# PharoGameye

![image](https://user-images.githubusercontent.com/49183340/224508985-aafac0c0-2247-4d01-8daa-6204033367dc.png)

Gameye.app tools for Pharo.

## Functionnalities

- Complete Gameye App model : ```Collection```, ```VideoGame```, ```System```, ```Peripheral```, ```ToyToLife``` and ```PrintMedia```.
- Exported spreadsheet parsing (.csv) for collection, wish list and for sell list.

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
