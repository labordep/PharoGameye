Class {
	#name : #GameyeCollectionFactoryV5Test,
	#superclass : #GameyeCollectionFactoryTest,
	#category : #'Gameye-Tests-Core'
}

{ #category : #samples }
GameyeCollectionFactoryV5Test class >> exportedSpreadsheetSampleContentV5_1System [
	"self exportedSpreadsheetSampleContentV5_1System"

	^self exportedSpreadsheetSampleHeadContentV5, '
"Sega Saturn","Systems","Owned","Sega Saturn Console","United Kingdom","Official","Missing Field","Missing Field","18/07/2022","Boxed","88.91","169.46","381.99","156.75","139.92","10","?","10"," "," ","","✔️ 📦",'
]

{ #category : #samples }
GameyeCollectionFactoryV5Test class >> exportedSpreadsheetSampleContentV5_1ToyToLife [
	
	^self exportedSpreadsheetSampleHeadContentV5, '
"amiibo","Toys To Life","Owned","Zelda - Breath of Wild","","Official","Nintendo","Missing Field","19/04/2022","Loose","24.40","?","29.41","24.40","15.00","10","?","?"," "," ","","",'
]

{ #category : #samples }
GameyeCollectionFactoryV5Test class >> exportedSpreadsheetSampleContentV5_1VideoGameWitComplexeStringValues [
	"This game have title and developper names with coma and quotes : ""Ivan ""Ironman"" Stewart's Super Off Road"" and ""Rare, Ltd."""

	^self exportedSpreadsheetSampleHeadContentV5, '
"Nintendo (NES)","Games","Owned","Ivan "Ironman" Stewart''s Super Off Road","United States of America","Official","Tradewest, Inc.","Rare, Ltd.","22/03/2021","CIB","11.77","45.78","236.47","45.78","-1.0","7","6","7"," "," ","","",'
]

{ #category : #samples }
GameyeCollectionFactoryV5Test class >> exportedSpreadsheetSampleContentV5_Empty [
	"This sample contains some frequently generated cases not easy to read/parse or exceptions due to collection evolution"

	^self exportedSpreadsheetSampleHeadContentV5
]

{ #category : #accessing }
GameyeCollectionFactoryV5Test class >> exportedSpreadsheetSampleFileReferenceV5_Empty [
	<script:'self exportedSpreadsheetSampleFileReferenceV5_Empty inspect'>

	^self exportedSpreadsheetSampleFileReference: self exportedSpreadsheetSampleContentV5_Empty
]

{ #category : #accessing }
GameyeCollectionFactoryV5Test class >> exportedSpreadsheetSampleHeadContentV5 [
	"This sample contains columns head"

	^'Platform,Category,UserRecordType,Title,Country,ReleaseType,Publisher,Developer,CreatedAt,Ownership,PriceLoose,PriceCIB,PriceNew,YourPrice,PricePaid,ItemCondition,BoxCondition,ManualCondition,Beat,PlayedCompletion,Notes,Tags'
]

{ #category : #tests }
GameyeCollectionFactoryV5Test >> setUp [ 

	super setUp.
	gameyeVersion := GameyeVersion v5.
]

{ #category : #tests }
GameyeCollectionFactoryV5Test >> testCreateCollectionFromExportedSpreadsheet_1System [

	| collection collectible |
	datas := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV5_1System).

	self createCollectionFromExportedSpreadsheet_1System.
	
	collection := datas at: GameyeCollection owned.
	collectible := collection systemsCollectibles first.
	self assert: collectible platform equals: 'Sega Saturn'.
	self assert: collectible title equals: 'Sega Saturn Console'.
	self assert: collectible country equals: #'United Kingdom'.
	self assert: collectible releaseType equals: #'Official'.
	self assert: collectible tags notNil.
]

{ #category : #tests }
GameyeCollectionFactoryV5Test >> testCreateCollectionFromExportedSpreadsheet_1ToyToLife [

	datas := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV5_1ToyToLife).

	self createCollectionFromExportedSpreadsheet_1ToyToLife.
]

{ #category : #tests }
GameyeCollectionFactoryV5Test >> testCreateCollectionFromExportedSpreadsheet_1VideoGameWitComplexeStringValues [

	datas := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV5_1VideoGameWitComplexeStringValues).

	self createCollectionFromExportedSpreadsheet_1VideoGameWitComplexeStringValues
]
