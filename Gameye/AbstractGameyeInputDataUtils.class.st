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
AbstractGameyeInputDataUtils class >> createCollectionsFromDataArray: anArrayOfACollection [
	"Return collections from array : collectibles, wishlist and for sell"
	| collection collections wishListCollection forSellCollection index |

	collections := Dictionary new.
	collection := GameyeCollection new gameyeVersion: self gameyeVersion; yourself.
	wishListCollection := GameyeCollection new gameyeVersion: self gameyeVersion; yourself.
	forSellCollection := GameyeCollection new gameyeVersion: self gameyeVersion; yourself.

	collections at: GameyeCollection owned put: collection.
	collections at: GameyeCollection wish put: wishListCollection.
	collections at: GameyeCollection forSell put: forSellCollection.

	anArrayOfACollection ifNil: [ ^ collections ].
	
	index := 0.
	
	anArrayOfACollection do:[ :anArrayOfACollectible |
		index := index + 1.
		(self createCollectibleFromDataArray: anArrayOfACollectible) ifNotNil:[ :collectible |
		
			"Processing for unknown collectible to help the debug"
			collectible rawIndex: index.
			
			"Add the collectible into the good list"
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
	
	self subclassResponsibility
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
	"Parse a CSV readstream as an Array"
	
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
