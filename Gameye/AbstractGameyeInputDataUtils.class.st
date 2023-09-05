Class {
	#name : #AbstractGameyeInputDataUtils,
	#superclass : #Object,
	#category : #'Gameye-Core'
}

{ #category : #parsing }
AbstractGameyeInputDataUtils class >> createCollectibleFromDataArray: anArray [
	
	self subclassResponsibility 
]

{ #category : #parsing }
AbstractGameyeInputDataUtils class >> createCollectionsFromDataArray: anArray [
	"Return collections from array : collectibles, wishlist and for sell"
	| collection collections wishListCollection forSellCollection |

	collections := Dictionary new.
	collection := GameyeCollection new gameyeVersion: self gameyeVersion; yourself.
	wishListCollection := GameyeCollection new gameyeVersion: self gameyeVersion; yourself.
	forSellCollection := GameyeCollection new gameyeVersion: self gameyeVersion; yourself.

	collections at: GameyeCollection owned put: collection.
	collections at: GameyeCollection wish put: wishListCollection.
	collections at: GameyeCollection forSell put: forSellCollection.

	anArray ifNil: [ ^ collections ].
	anArray do:[ :e |
		(self createCollectibleFromDataArray: e) ifNotNil:[ :collectible |
			collectible isForSale ifTrue:[ forSellCollection addCollectible: collectible ] ifFalse:[
				collectible isOnWishList ifTrue:[ wishListCollection addCollectible: collectible ] ifFalse:[
					collection addCollectible: collectible.
				].
			].
		].
	].

	^ collections
]

{ #category : #accessing }
AbstractGameyeInputDataUtils class >> exportedSpreadsheetColumn01Title [

	^ 'Platform'
]

{ #category : #accessing }
AbstractGameyeInputDataUtils class >> exportedSpreadsheetPeripheralType [

	^ '"Peripherals"'
]

{ #category : #accessing }
AbstractGameyeInputDataUtils class >> exportedSpreadsheetPrintMediaType [

	^ '"Print Media"'
]

{ #category : #accessing }
AbstractGameyeInputDataUtils class >> exportedSpreadsheetSystemType [

	^ '"Systems"'
]

{ #category : #accessing }
AbstractGameyeInputDataUtils class >> exportedSpreadsheetToyToLifeType [

	^ self subclassResponsibility
]

{ #category : #accessing }
AbstractGameyeInputDataUtils class >> exportedSpreadsheetVideoGameType [

	^ self subclassResponsibility 
]

{ #category : #private }
AbstractGameyeInputDataUtils class >> extractCellsFromLine: aString [
	| cells newCells safeCells type |

	cells := aString substrings: ','.
	cells size = self numberOfExportedSpreadsheetColumns ifTrue:[ ^ cells asArray ].

	"Recreate cells from 1 to 5 (no problematic cells)"
	newCells := OrderedCollection new.
	safeCells := newCells copy asArray.
	1 to: 5 do:[ :i | newCells add: (cells at: i) ].

	"Not found case : why this case can be possible ?"
	cells size > self numberOfExportedSpreadsheetColumns ifFalse:[ ^ safeCells ].

	"Processing for Games or Systems"
	type := cells at: 2.
	(type = self exportedSpreadsheetVideoGameType or:[type = self exportedSpreadsheetSystemType or:[type = self exportedSpreadsheetPeripheralType]]) ifTrue:[ | rebuildedCells |

		"A comma or more are inside datas, probably inside string datas as title or editor name or comment (etc.).
		Try to cut manually and format the comma into HTML code &#44; to ignor the comma during parsing"

		"Problematic cells : 6, 7, 8, 21, extract all cells of the array to rebuild the correct number of cell"
		rebuildedCells := self rebuildCells: (cells copyFrom: 6 to: cells size).
		newCells addAll: rebuildedCells.
	].

	newCells size ~= self numberOfExportedSpreadsheetColumns ifTrue:[
		"Not found case : why this case can be possible ?"
		^ safeCells
	].

	^newCells asArray
]

{ #category : #accessing }
AbstractGameyeInputDataUtils class >> gameyeVersion [ 

	self subclassResponsibility
]

{ #category : #parsing }
AbstractGameyeInputDataUtils class >> getDateFromExportedSpreadsheetFilename: aString [

	| a |
	aString ifNil:[ ^ nil ].

	"Check if the date is on the filename and add it to the collection data"
	(('##_##_####_*.csv' match: aString) or:[('#_##_####_*.csv' match: aString) or:[('#_#_####_*.csv' match: aString)]]) ifFalse:[ ^ nil ].

	a := (aString substrings: '_').
	^ Date newDay: (a at: 2) asInteger month: (a at: 1) asInteger year: (a at: 3) asInteger
]

{ #category : #testing }
AbstractGameyeInputDataUtils class >> getSpreadsheetFileReferenceGameyeVersion: aFileReference [
	"Return a ReadStream of an exported SpreadSheet file with fixing all knowns generation knowns problems"

	| line columns readStream |
	readStream := aFileReference readStream.
	readStream ifNil:[ ^ GameyeVersion unknown ].

	"Check if the first line (normally it's columns head) have the good number of columns and the good first title"
	line := readStream nextLine.
	readStream close.
	columns := (line substrings: ',').
	
	"V5 check"
	(columns size = GameyeV5InputDataUtils numberOfExportedSpreadsheetColumns and:[
		columns first = GameyeV5InputDataUtils exportedSpreadsheetColumn01Title]) ifTrue:[ ^ GameyeVersion v5 ].
	
	"V4 check"
	(columns size = GameyeV4InputDataUtils numberOfExportedSpreadsheetColumns and:[
		columns first = GameyeV4InputDataUtils exportedSpreadsheetColumn01Title]) ifTrue:[ ^ GameyeVersion v4 ].

	^ GameyeVersion unknown 
]

{ #category : #parsing }
AbstractGameyeInputDataUtils class >> getSpreadsheetReadStream: aFileReference [
	
	self subclassResponsibility 
]

{ #category : #accessing }
AbstractGameyeInputDataUtils class >> isAbstract [ 

	^ self == AbstractGameyeInputDataUtils
]

{ #category : #accessing }
AbstractGameyeInputDataUtils class >> numberOfExportedSpreadsheetColumns [

	self subclassResponsibility
]

{ #category : #parsing }
AbstractGameyeInputDataUtils class >> parseExportedSpreadsheetReadStream: aReadStream [
	
	self subclassResponsibility 
]

{ #category : #parsing }
AbstractGameyeInputDataUtils class >> parseNeoNumberString: aString [

	aString = '-1.0' ifTrue:[ ^ nil ].
	aString = '?' ifTrue:[ ^ nil ].

	^ NeoNumberParser parse: aString ifFail: [nil]
]

{ #category : #private }
AbstractGameyeInputDataUtils class >> rebuildCells: aCellsArray [
	| newCells |

	newCells := OrderedCollection new.
	1 to: aCellsArray size do:[ :index | | cell previousCell currentCell nextCell cells |

		previousCell := ((index - 1) > 0) ifTrue:[aCellsArray at: (index - 1)] ifFalse:[nil].
		currentCell := aCellsArray at: index.
		nextCell := (aCellsArray size >= (index + 1)) ifTrue:[aCellsArray at: (index + 1)] ifFalse:[nil].

		"Remove no necessary blanks"
		cell := currentCell withBlanksCondensed.

		"Check if the begin and the end of the cell are quotes, if not this is probably that the cell contains a comma and try to recompose with next cell"
		(cell first = $" and:[cell last = $"]) ifTrue:[
			newCells add: cell.
		] ifFalse:[
			nextCell ifNotNil:[
				"Problem detected : a comma is present in the string, recompose the string with the next cell"
				currentCell := currentCell,'&#44;', nextCell.

				"Rebuild all the cells with removing the next cell"
				cells := OrderedCollection with: currentCell.
				cells addAll: (aCellsArray copyFrom: (index + 2) to: (aCellsArray size)).

				newCells := newCells asOrderedCollection.
				newCells addAll: (self rebuildCells: cells).
				^ newCells asArray

			].
		].

	].

	^newCells asArray
]

{ #category : #'error signalling' }
AbstractGameyeInputDataUtils class >> signalNotSupportedSpreadsheetFile [

	^ NotSupportedSpreadsheetFileGameyeError signal 
]

{ #category : #'see class side' }
AbstractGameyeInputDataUtils >> seeClassSide [
]
