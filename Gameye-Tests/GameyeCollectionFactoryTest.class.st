"
A GameyeInputDataReaderTest is a test class for testing the behavior of GameyeInputDataReader
"
Class {
	#name : #GameyeCollectionFactoryTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Core'
}

{ #category : #samples }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent_1PeripheralAsAUnknownCollectible [

	^self exportedSpreadsheetSampleHeadContent, '
"SNES","?",1,0,0,"Super Scope 6 [Gun Bundle]","Missing Field","Missing Field","13/09/2021","Boxed","-1.0", "-1.0", "-1.0", "-1.0","55.97","10","?","9"," "," ","This is a commentary"'
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
