Class {
	#name : #GameyeCollectionFactoryV5Test,
	#superclass : #GameyeCollectionFactoryTest,
	#category : #'Gameye-Tests-Core'
}

{ #category : #samples }
GameyeCollectionFactoryV5Test class >> exportedSpreadsheetSampleContentV5_1BadElement [
	"Test to create an unknown element when a problem appears"

	^self exportedSpreadsheetSampleHeadContentV5, '
"","","","","","","","","","","","","","","","","",""," "," ","","",'
]

{ #category : #samples }
GameyeCollectionFactoryV5Test class >> exportedSpreadsheetSampleContentV5_1ControllerWithTags [
	
	^self exportedSpreadsheetSampleHeadContentV5, '
"Sega Master System","Controllers","Owned","Master System Controller","United States of America","Official","Sega","Missing Field","14/08/2023","Loose","36.07","?","44.40","36.07","-1.0","8","?","?"," "," ","Remplacer croix directionnelle ","A nettoyer,HS",'
]

{ #category : #samples }
GameyeCollectionFactoryV5Test class >> exportedSpreadsheetSampleContentV5_1FoundVideoGameAnd1NotFoundVideoGame [
	"Two games : one found in the database and one not found in the database (red title)"

	^self exportedSpreadsheetSampleHeadContentV5, '
"Sega Saturn","Games","Owned","SimCity 2000","United States of America","Official","Missing Field","Missing Field","24/02/2022","CIB","17.93","22.22","66.11","22.22","30.00","10","10","10"," "," ","","",
"Sony PlayStation","Games","Owned","Sim City 2000","","Official","Missing Field","Missing Field","22/03/2021","CIB","-1.0", "-1.0", "-1.0", "-1.0","-1.0","10","7","10"," "," ","","Remplacer boite",'
]

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
GameyeCollectionFactoryV5Test class >> exportedSpreadsheetSampleContentV5_1VideoGameWitComplexeStringValues2 [
	"This game have problem in v5 but works in v4"

	^self exportedSpreadsheetSampleHeadContentV5, '
"Nintendo 64","Games","Owned","Hey You, Pikachu!","United States of America","Official","Nintendo","Ambrella","23/08/2021","CIB","4.63","130.63","365.30","130.63","6.98","10","9","9"," "," ","C’est le jeu seul et pas le pack avec accessoires ","❔,JAP",'
]

{ #category : #samples }
GameyeCollectionFactoryV5Test class >> exportedSpreadsheetSampleContentV5_5VideoGames [
	"This list have different type of ownership"

	^self exportedSpreadsheetSampleHeadContentV5, '
	"Nintendo Game Boy Advance","Games","Owned","Game & Watch Gallery Advance","United Kingdom","Official","Nintendo","Tose","30/12/2021","New","11.83","26.13","167.55","167.55","90.00","?","10","?"," "," ","","",
	"Nintendo Game Boy Advance","Games","Owned","Excitebike NES Classics","United Kingdom","Official","Nintendo","Nintendo","12/07/2022","CIB","11.27","27.28","54.56","27.28","105.00","10","10","10"," "," ","","",
	"Sony PlayStation","Games","Owned","Gran Turismo 2","United Kingdom","Official","Sony","Polyphony Digital Inc.","26/04/2022","Boxed","5.72","11.28","111.57","8.56","10.00","8","10","?"," "," ","Disc 1 non fonctionnel ","Incomplet",
	"Nintendo 64","Games","Owned","Pokémon Stadium 2","United Kingdom","Official","Nintendo","Nintendo EAD","08/04/2021","Loose","56.08","151.18","515.10","56.08","70.00","10","?","?"," "," ","Cartouche NOE","",
	"Super Nintendo (SNES)","Games","Owned","Pilotwings","United Kingdom","Official","Nintendo","Nintendo EAD","25/06/2021","Loose+","12.49","29.23","71.06","20.10","9.99","10","?","10"," "," ","","",
'
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
GameyeCollectionFactoryV5Test >> testCreateCollectionFromExportedSpreadsheet_1BadElement [

	datas := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV5_1BadElement).

	self createCollectionFromExportedSpreadsheet_1BadElement
]

{ #category : #tests }
GameyeCollectionFactoryV5Test >> testCreateCollectionFromExportedSpreadsheet_1ControllerWithTags [

	datas := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV5_1ControllerWithTags).

	self createCollectionFromExportedSpreadsheet_1ControllerWithTags
]

{ #category : #tests }
GameyeCollectionFactoryV5Test >> testCreateCollectionFromExportedSpreadsheet_1FoundVideoGameAnd1NotFoundVideoGame [

	datas := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV5_1FoundVideoGameAnd1NotFoundVideoGame).

	self createCollectionFromExportedSpreadsheet_1FoundVideoGameAnd1NotFoundVideoGame
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
GameyeCollectionFactoryV5Test >> testCreateCollectionFromExportedSpreadsheet_1VideoGameWithComplexeStringValues [

	datas := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV5_1VideoGameWitComplexeStringValues).

	self createCollectionFromExportedSpreadsheet_1VideoGameWitComplexeStringValues
]

{ #category : #tests }
GameyeCollectionFactoryV5Test >> testCreateCollectionFromExportedSpreadsheet_1VideoGameWithComplexeStringValues2 [

	datas := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV5_1VideoGameWitComplexeStringValues2).

	self createCollectionFromExportedSpreadsheet_1VideoGameWitComplexeStringValues2
]

{ #category : #tests }
GameyeCollectionFactoryV5Test >> testCreateCollectionFromExportedSpreadsheet_5VideoGamesWithDifferentOwnership [

	datas := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV5_5VideoGames).

	self createCollectionFromExportedSpreadsheet_5VideoGamesWithDifferentOwnership
]
