"
A GameyeInputDataReaderTest is a test class for testing the behavior of GameyeInputDataReader
"
Class {
	#name : #GameyeCollectionFactoryTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Core'
}

{ #category : #samples }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent_1Peripheral [

	^self exportedSpreadsheetSampleHeadContent, '
"N64","Peripherals",1,0,0,"Expansion Pak","Missing Field","Missing Field","10/07/2021","CIB","46.63","77.35","112.19","77.35","51.85","10","10","10"," "," ",""'
]

{ #category : #samples }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent_1PeripheralAsAUnknownCollectible [

	^self exportedSpreadsheetSampleHeadContent, '
"SNES","?",1,0,0,"Super Scope 6 [Gun Bundle]","Missing Field","Missing Field","13/09/2021","Boxed","-1.0", "-1.0", "-1.0", "-1.0","55.97","10","?","9"," "," ","This is a commentary"'
]

{ #category : #samples }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent_1PrintMedia [
	"1 Print media sample"

	^self exportedSpreadsheetSampleHeadContent, '
"N Power","Print Media",1,0,0,"[Vol. 145] Mario Advance","Missing Field","Missing Field","11/03/2023","Loose","9.49","14.23","?","9.49","1.90","?","?","10"," "," ",""'
]

{ #category : #samples }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent_1System [
	"1 System sample"

	^self exportedSpreadsheetSampleHeadContent, '
"Saturn","Systems",1,0,0,"Sega Saturn Console (PAL)","Missing Field","Missing Field","18/07/2022","Boxed","88.91","169.46","381.99","156.75","139.92","10","?","10"," "," ",""'
]

{ #category : #samples }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent_1ToyToLife [
	"1 System sample"

	^self exportedSpreadsheetSampleHeadContent, '
"amiibo","ToysToLife",1,0,0,"Zelda - Breath of Wild","Missing Field","Missing Field","19/04/2022","Loose","26.11","26.11","36.44","26.11","13.99","?","?","10"," "," ",""'
]

{ #category : #samples }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent_1VideoGameWitComplexeStringValues [
	"This game have title and developper names with coma and quotes : ""Ivan ""Ironman"" Stewart's Super Off Road"" and ""Rare, Ltd."""

	^self exportedSpreadsheetSampleHeadContent, '
"NES","VideoGame",1,0,0,"Ivan "Ironman" Stewart''s Super Off Road","Tradewest, Inc.","Rare, Ltd.","22/03/2021","CIB","10.85","46.64","326.48","46.64","-1.0","6","7","7"," "," ",""'
]

{ #category : #samples }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent_Empty [
	"This sample contains some frequently generated cases not easy to read/parse or exceptions due to collection evolution"

	^self exportedSpreadsheetSampleHeadContent
]

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
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleFileReference_Empty [
	<script:'self exportedSpreadsheetSampleFileReference_Empty inspect'>

	^self exportedSpreadsheetSampleFileReference: self exportedSpreadsheetSampleContent_Empty
]

{ #category : #accessing }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleFilename [

	^'2_20_2023_ge_collection'
]

{ #category : #accessing }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleHeadContent [
	"This sample contains columns head"

	^'Platform,Type,Owned,ForSale,Wishlist,Title,Publisher,Developer,DateAdded,Ownership,PriceLoose,PriceCIB,PriceNew,YourPrice,PricePaid,ItemCondition,BoxCondition,ManualCondition,Beat,PlayedCompletion,Notes'
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_1Peripheral [

	| collection collectible |
	collection := GameyeCollectionFactory createCollectionFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_1Peripheral).

	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection peripheralsCollectibles first.
	self assert: collectible isPeripheral
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_1PeripheralAsAUnknownCollectible [

	| collection collectible |
	collection := GameyeCollectionFactory createCollectionFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_1PeripheralAsAUnknownCollectible).

	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection unknownsCollectibles first.
	self assert: collectible isUnknown.
	self assert: collectible rawDatas size equals: GameyeCollectionFactory numberOfExportedSpreadsheetColumns
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_1PrintMedia [

	| collection collectible |
	collection := GameyeCollectionFactory createCollectionFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_1PrintMedia).

	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection printMediasCollectibles first.
	self assert: collectible isPrintMedia
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_1System [

	| collection collectible |
	collection := GameyeCollectionFactory createCollectionFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_1System).

	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection systemsCollectibles first.
	self assert: collectible isSystem.
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_1ToyToLife [

	| collection collectible |
	collection := GameyeCollectionFactory createCollectionFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_1ToyToLife).

	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection toysToLifeCollectibles first.
	self assert: collectible isToyToLife
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_1VideoGameWitComplexeStringValues [

	| collection collectible |
	collection := GameyeCollectionFactory createCollectionFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_1VideoGameWitComplexeStringValues).

	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection videoGamesCollectibles first.
	self assert: collectible isVideoGame
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_Empty [

	| collection |
	collection := GameyeCollectionFactory createCollectionFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_Empty).

	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection numberOfCollectibles equals: 0.
	 
]
