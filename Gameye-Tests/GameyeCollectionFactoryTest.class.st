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

{ #category : #accessing }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent_3VideoGames2SystemsWitComplexeStringValues [
	"This is an extract from problematic strings content"

	^self exportedSpreadsheetSampleHeadContent, '
"Atari 2600","VideoGame",1,0,0,"Q*bert","Atari, Inc.","Parker Brothers","22/03/2021","Loose","6.97","16.37","42.73","6.97","?","?","?","8"," "," ",""
"Atari 2600","VideoGame",1,0,0,"Space Invaders","(null)","(null)","22/03/2021","Loose","-1.0", "-1.0", "-1.0", "-1.0","?","?","?","5"," "," ","Étiquette percée, en pack avec la console"
"Atari 2600","Systems",1,0,0,"Atari 2600 System [Vadar]","Missing Field","Missing Field","04/04/2021","CIB","54.38","146.51","219.34","146.51","71.21","10","9","10"," "," ","Pack avec Space invaders, modèle cx-2600-gp"
"Atari 2600","Systems",1,0,0,"Atari 2600 System [Vadar]","Missing Field","Missing Field","15/04/2021","CIB","54.38","146.51","219.34","146.51","?","10","10","10"," "," ","Avec le jeu othello, modèle cx-2600-gp"
"PS1","VideoGame",1,0,0,"Broken Sword 2 - Les Boucliers de Quetzalcoatl","Sony","Revolution Software Ltd.","22/03/2021","CIB","-1.0", "-1.0", "-1.0", "-1.0","-1.0","10","10","10"," "," ",""'
]

{ #category : #samples }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent_4VideoGamesWitComplexeStringValues [
	"This game have title and developper names with coma and quotes : ""Ivan ""Ironman"" Stewart's Super Off Road"" and ""Rare, Ltd."""

	^self exportedSpreadsheetSampleHeadContent, '
"NES","VideoGame",1,0,0,"Ivan "Ironman" Stewart''s Super Off Road","Tradewest, Inc.","Rare, Ltd.","22/03/2021","CIB","10.85","46.64","326.48","46.64","-1.0","6","7","7"," "," ","
"Atari 2600","VideoGame",1,0,0,"Space Invaders","(null)","(null)","22/03/2021","Loose","-1.0", "-1.0", "-1.0", "-1.0","?","?","?","5"," "," ","Étiquette percée, en pack avec la console"
"NES","VideoGame",1,0,0,"Ivan "Ironman" Stewart''s Super Off Road","Tradewest, Inc.","Rare, Ltd.","22/03/2021","CIB","10.85","46.64","326.48","46.64","-1.0","6","7","7"," "," ",""
"Atari 2600","VideoGame",1,0,0,"Space Invaders","(null)","(null)","22/03/2021","Loose","-1.0", "-1.0", "-1.0", "-1.0","?","?","?","5"," "," ","Étiquette percée, en pack avec la console"'
]

{ #category : #samples }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent_Empty [
	"This sample contains some frequently generated cases not easy to read/parse or exceptions due to collection evolution"

	^self exportedSpreadsheetSampleHeadContent
]

{ #category : #samples }
GameyeCollectionFactoryTest class >> exportedSpreadsheetSampleContent_Wishlist_1VideoGame [
	"This game have title and developper names with coma and quotes : ""Ivan ""Ironman"" Stewart's Super Off Road"" and ""Rare, Ltd."""

	^self exportedSpreadsheetSampleHeadContent, '
"Switch","VideoGame",0,0,1,"Advance Wars 1+2: Re-Boot Camp","Nintendo","WayForward Technologies","","Wishlist","-1.0", "-1.0", "-1.0", "-1.0","-1.0"," "," "," "," "," ",""'
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

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_1Peripheral [

	| collection collectible collections |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet:  (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_1Peripheral).

	collection := collections at: GameyeCollection owned.
	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection haveVideoGames equals: false.
	self assert: collection haveSystems equals: false.
	self assert: collection havePeripherals equals: true.
	self assert: collection haveToyToLife equals: false.
	self assert: collection havePrintMedias equals: false.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection peripheralsCollectibles first.
	self assert: collectible isPeripheral.
	self assert: collectible dateAdded equals: (Date newDay: 10 month: 7 year: 2021).

	self assertWishAndForSellCollectionsAreEmpty: collections
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_1PeripheralAsAUnknownCollectible [

	| collection collectible collections |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_1PeripheralAsAUnknownCollectible).

	collection := collections at: GameyeCollection owned.
	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: true.
	self assert: collection haveVideoGames equals: false.
	self assert: collection haveSystems equals: false.
	self assert: collection havePeripherals equals: false.
	self assert: collection haveToyToLife equals: false.
	self assert: collection havePrintMedias equals: false.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection unknownsCollectibles first.
	self assert: collectible isUnknown.
	self assert: collectible dateAdded equals: (Date newDay: 13 month: 9 year: 2021).
	self assert: collectible rawDatas size equals: GameyeCollectionFactory numberOfExportedSpreadsheetColumns.

	self assertWishAndForSellCollectionsAreEmpty: collections
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_1PrintMedia [

	| collection collectible collections |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_1PrintMedia).

	collection := collections at: GameyeCollection owned.
	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection haveVideoGames equals: false.
	self assert: collection haveSystems equals: false.
	self assert: collection havePeripherals equals: false.
	self assert: collection haveToyToLife equals: false.
	self assert: collection havePrintMedias equals: true.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection printMediasCollectibles first.
	self assert: collectible dateAdded equals: (Date newDay: 11 month: 3 year: 2023).
	self assert: collectible isPrintMedia.

	self assertWishAndForSellCollectionsAreEmpty: collections
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_1System [

	| collection collectible collections |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_1System).

	collection := collections at: GameyeCollection owned.
	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection haveVideoGames equals: false.
	self assert: collection haveSystems equals: true.
	self assert: collection havePeripherals equals: false.
	self assert: collection haveToyToLife equals: false.
	self assert: collection havePrintMedias equals: false.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection systemsCollectibles first.
	self assert: collectible dateAdded equals: (Date newDay: 18 month: 7 year: 2022).
	self assert: collectible isSystem.

	self assertWishAndForSellCollectionsAreEmpty: collections
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_1ToyToLife [

	| collection collectible collections |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_1ToyToLife).

	collection := collections at: GameyeCollection owned.
	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection haveVideoGames equals: false.
	self assert: collection haveSystems equals: false.
	self assert: collection havePeripherals equals: false.
	self assert: collection haveToyToLife equals: true.
	self assert: collection havePrintMedias equals: false.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection toysToLifeCollectibles first.
	self assert: collectible dateAdded equals: (Date newDay: 19 month: 4 year: 2022).
	self assert: collectible isToyToLife.

	self assertWishAndForSellCollectionsAreEmpty: collections
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_1VideoGameWitComplexeStringValues [

	| collection collectible collections |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_1VideoGameWitComplexeStringValues).

	collection := collections at: GameyeCollection owned.
	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection haveVideoGames equals: true.
	self assert: collection haveSystems equals: false.
	self assert: collection havePeripherals equals: false.
	self assert: collection haveToyToLife equals: false.
	self assert: collection havePrintMedias equals: false.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection videoGamesCollectibles first.
	self assert: collectible dateAdded equals: (Date newDay: 22 month: 3 year: 2021).
	self assert: collectible isVideoGame.

	self assertWishAndForSellCollectionsAreEmpty: collections
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_3VideoGames2SystemsWitComplexeStringValues [

	| collection collections |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_3VideoGames2SystemsWitComplexeStringValues).

	collection := collections at: GameyeCollection owned.
	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection haveVideoGames equals: true.
	self assert: collection haveSystems equals: true.
	self assert: collection havePeripherals equals: false.
	self assert: collection haveToyToLife equals: false.
	self assert: collection havePrintMedias equals: false.
	self assert: collection numberOfCollectibles equals: 5.
	1 to: 3 do:[ :i | self assert: (collection videoGamesCollectibles at: i) isVideoGame ].
	1 to: 2 do:[ :i | self assert: (collection systemsCollectibles at: i) isSystem ].

	self assertWishAndForSellCollectionsAreEmpty: collections
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_Empty [

	| collection collections |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_Empty).

	collection := collections at: GameyeCollection owned.
	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection haveVideoGames equals: false.
	self assert: collection haveSystems equals: false.
	self assert: collection havePeripherals equals: false.
	self assert: collection haveToyToLife equals: false.
	self assert: collection havePrintMedias equals: false.
	self assert: collection numberOfCollectibles equals: 0.

	self assertWishAndForSellCollectionsAreEmpty: collections
]

{ #category : #tests }
GameyeCollectionFactoryTest >> testCreateCollectionFromExportedSpreadsheet_Wishlist_1VideoGame [

	| collections wishListCollection collection forSellCollection |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContent_Wishlist_1VideoGame).

	self assert: collections size equals: 3.

	wishListCollection := collections at: GameyeCollection wish.
	self assert: wishListCollection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: wishListCollection haveUnknowns equals: false.
	self assert: wishListCollection haveVideoGames equals: true.
	self assert: wishListCollection haveSystems equals: false.
	self assert: wishListCollection havePeripherals equals: false.
	self assert: wishListCollection haveToyToLife equals: false.
	self assert: wishListCollection havePrintMedias equals: false.
	self assert: wishListCollection numberOfCollectibles equals: 1.

	collection := collections at: GameyeCollection owned.
	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection haveVideoGames equals: false.
	self assert: collection haveSystems equals: false.
	self assert: collection havePeripherals equals: false.
	self assert: collection haveToyToLife equals: false.
	self assert: collection havePrintMedias equals: false.
	self assert: collection numberOfCollectibles equals: 0.

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
