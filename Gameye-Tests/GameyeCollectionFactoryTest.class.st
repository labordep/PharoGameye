"
A GameyeInputDataReaderTest is a test class for testing the behavior of GameyeInputDataReader
"
Class {
	#name : #GameyeCollectionFactoryTest,
	#superclass : #TestCase,
	#instVars : [
		'datas'
	],
	#category : #'Gameye-Tests-Core'
}

{ #category : #utils }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleFileReference: aString [
	
	^self exportedSpreadsheetSampleFileReference: nil content: aString
]

{ #category : #utils }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleFileReference: aFileName content: aString [
	
	| fileSystem file |
	fileSystem := FileSystem memory.
	fileSystem createDirectory: 'gameye-samples'.
	file := fileSystem workingDirectory / 'gameye-samples' / ((aFileName ifNil:[self exportedSpreadsheetSampleFilename]) asString, '.csv').
	file writeStreamDo: [ :stream | stream nextPutAll: aString asString ].
	^file
]

{ #category : #accessing }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleFilename [

	^'2_20_2023_ge_collection'
]

{ #category : #assertions }
GameyeCollectionFactoryTest >> assertWishAndForSellCollectionsAreEmpty: collections [
	| wishListCollection forSellCollection |

	wishListCollection := collections at: GameyeCollection wish.
	self assert: wishListCollection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: wishListCollection haveUnknowns equals: false.
	self assert: wishListCollection haveVideoGames equals: false.
	self assert: wishListCollection haveSystems equals: false.
	self assert: wishListCollection havePeripherals equals: false.
	self assert: wishListCollection haveToyToLife equals: false.
	self assert: wishListCollection havePrintMedias equals: false.
	self assert: wishListCollection numberOfCollectibles equals: 0.

	forSellCollection := collections at: GameyeCollection forSell.
	self assert: forSellCollection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: forSellCollection haveUnknowns equals: false.
	self assert: forSellCollection haveVideoGames equals: false.
	self assert: forSellCollection haveSystems equals: false.
	self assert: forSellCollection havePeripherals equals: false.
	self assert: forSellCollection haveToyToLife equals: false.
	self assert: forSellCollection havePrintMedias equals: false.
	self assert: forSellCollection numberOfCollectibles equals: 0
]

{ #category : #running }
GameyeCollectionFactoryTest >> setUp [

	super setUp.
	datas := nil
]

{ #category : #running }
GameyeCollectionFactoryTest >> tearDown [

	datas := nil.
	super tearDown
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromNotSupportedFiles [
	| error |
	
	error := nil.
	[ GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: nil ] onErrorDo: [ :e | error := e].
	self assert: error class equals: NotAFileGameyeError.
]
