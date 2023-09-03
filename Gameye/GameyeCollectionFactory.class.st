"
This class read datas exported from Gameye.
Data can be a file reference.
"
Class {
	#name : #GameyeCollectionFactory,
	#superclass : #Object,
	#category : #'Gameye-Core'
}

{ #category : #'create collection' }
GameyeCollectionFactory class >> createCollectionsFromExportedSpreadsheet: aFileReference [
	"Return all collections from a file : collectibles, for sell and wish list"
	| readStream array date collections fileName utilsClass |

	aFileReference ifNil:[ ^ self signalNotAFile ].
	aFileReference isFile ifFalse:[ ^ self signalNotAFile ].

	utilsClass := self inputDataUtilsClassForSpreadsheetFile: aFileReference.

	readStream := utilsClass getSpreadsheetReadStream: aFileReference.
	array := utilsClass parseExportedSpreadsheetReadStream: readStream.
	collections := (utilsClass createCollectionsFromDataArray: array) ifNil:[ ^ nil ].		

	"Check if the date is on the filename and add it to the collection data"
	fileName := aFileReference path basename.
	date := utilsClass getDateFromExportedSpreadsheetFilename: fileName.

	fileName := aFileReference path basenameWithoutExtension.
	collections keysAndValuesDo:[ :k :collection | 
		collection name: fileName, (k = GameyeCollection wish ifTrue:['_wish'] ifFalse:[k = GameyeCollection forSell ifTrue:['_forSell'] ifFalse:['']]).
		collection date: date. 
	].
	
	^ collections

	
]

{ #category : #'create collection' }
GameyeCollectionFactory class >> createForSellCollectionFromExportedSpreadsheet: aFileReference [
	"Return just the for seell collection (not collection and wish list collections)"
	
	| collections |
	collections := self createCollectionsFromExportedSpreadsheet: aFileReference.
	collections ifNil:[ ^ nil ].
	
	^ collections at: GameyeCollection forSell
]

{ #category : #'create collection' }
GameyeCollectionFactory class >> createOwnedCollectionFromExportedSpreadsheet: aFileReference [
	"Return just the collectibles collection (not for sell and wish list collections)"
	
	| collections |
	collections := self createCollectionsFromExportedSpreadsheet: aFileReference.
	collections ifNil:[ ^ nil ].
	
	^ collections at: GameyeCollection owned
]

{ #category : #'create collection' }
GameyeCollectionFactory class >> createWishListCollectionFromExportedSpreadsheet: aFileReference [
	"Return just the wish list collection (not collection and for sell collections)"
	
	| collections |
	collections := self createCollectionsFromExportedSpreadsheet: aFileReference.
	collections ifNil:[ ^ nil ].
	
	^ collections at: GameyeCollection wish
]

{ #category : #private }
GameyeCollectionFactory class >> inputDataUtilsClassForSpreadsheetFile: aFileReference [
	"Return the corresponding utility class to manage a spreadsheet readstream"

	| gameyeVersion |
	gameyeVersion := AbstractGameyeInputDataUtils getSpreadsheetFileReferenceGameyeVersion: aFileReference.
	gameyeVersion = GameyeVersion v5 ifTrue:[ ^ GameyeV5InputDataUtils ].
	gameyeVersion = GameyeVersion v4 ifTrue:[ ^ GameyeV4InputDataUtils ].
	
	^ AbstractGameyeInputDataUtils signalNotSupportedSpreadsheetFile
]

{ #category : #'error signalling' }
GameyeCollectionFactory class >> signalNotAFile [

	^ NotAFileGameyeError signal
]

{ #category : #'see class side' }
GameyeCollectionFactory >> seeClassSide [
]
