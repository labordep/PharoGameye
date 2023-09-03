Class {
	#name : #GameyeCollectionFactoryV4Test,
	#superclass : #GameyeCollectionFactoryTest,
	#category : #'Gameye-Tests-Core'
}

{ #category : #samples }
GameyeCollectionFactoryV4Test class >> exportedSpreadsheetSampleContentV4_1Peripheral [

	^self exportedSpreadsheetSampleHeadContentV4, '
"N64","Peripherals",1,0,0,"Expansion Pak","Missing Field","Missing Field","10/07/2021","CIB","46.63","77.35","112.19","77.35","51.85","10","10","10"," "," ",""'
]

{ #category : #samples }
GameyeCollectionFactoryV4Test class >> exportedSpreadsheetSampleContentV4_1PeripheralAsAUnknownCollectible [

	^self exportedSpreadsheetSampleHeadContentV4, '
"SNES","?",1,0,0,"Super Scope 6 [Gun Bundle]","Missing Field","Missing Field","13/09/2021","Boxed","-1.0", "-1.0", "-1.0", "-1.0","55.97","10","?","9"," "," ","This is a commentary"'
]

{ #category : #samples }
GameyeCollectionFactoryV4Test class >> exportedSpreadsheetSampleContentV4_1PrintMedia [
	"1 Print media sample"

	^self exportedSpreadsheetSampleHeadContentV4, '
"N Power","Print Media",1,0,0,"[Vol. 145] Mario Advance","Missing Field","Missing Field","11/03/2023","Loose","9.49","14.23","?","9.49","1.90","?","?","10"," "," ",""'
]

{ #category : #samples }
GameyeCollectionFactoryV4Test class >> exportedSpreadsheetSampleContentV4_1System [
	"1 System sample"

	^self exportedSpreadsheetSampleHeadContentV4, '
"Saturn","Systems",1,0,0,"Sega Saturn Console (PAL)","Missing Field","Missing Field","18/07/2022","Boxed","88.91","169.46","381.99","156.75","139.92","10","?","10"," "," ",""'
]

{ #category : #samples }
GameyeCollectionFactoryV4Test class >> exportedSpreadsheetSampleContentV4_1ToyToLife [
	"1 System sample"

	^self exportedSpreadsheetSampleHeadContentV4, '
"amiibo","ToysToLife",1,0,0,"Zelda - Breath of Wild","Missing Field","Missing Field","19/04/2022","Loose","26.11","26.11","36.44","26.11","13.99","?","?","10"," "," ",""'
]

{ #category : #samples }
GameyeCollectionFactoryV4Test class >> exportedSpreadsheetSampleContentV4_1VideoGameWitComplexeStringValues [
	"This game have title and developper names with coma and quotes : ""Ivan ""Ironman"" Stewart's Super Off Road"" and ""Rare, Ltd."""

	^self exportedSpreadsheetSampleHeadContentV4, '
"NES","VideoGame",1,0,0,"Ivan "Ironman" Stewart''s Super Off Road","Tradewest, Inc.","Rare, Ltd.","22/03/2021","CIB","10.85","46.64","326.48","46.64","-1.0","6","7","7"," "," ",""'
]

{ #category : #samples }
GameyeCollectionFactoryV4Test class >> exportedSpreadsheetSampleContentV4_3VideoGames2SystemsWitComplexeStringValues [
	"This is an extract from problematic strings content"

	^self exportedSpreadsheetSampleHeadContentV4, '
"Atari 2600","VideoGame",1,0,0,"Q*bert","Atari, Inc.","Parker Brothers","22/03/2021","Loose","6.97","16.37","42.73","6.97","?","?","?","8"," "," ",""
"Atari 2600","VideoGame",1,0,0,"Space Invaders","(null)","(null)","22/03/2021","Loose","-1.0", "-1.0", "-1.0", "-1.0","?","?","?","5"," "," ","Étiquette percée, en pack avec la console"
"Atari 2600","Systems",1,0,0,"Atari 2600 System [Vadar]","Missing Field","Missing Field","04/04/2021","CIB","54.38","146.51","219.34","146.51","71.21","10","9","10"," "," ","Pack avec Space invaders, modèle cx-2600-gp"
"Atari 2600","Systems",1,0,0,"Atari 2600 System [Vadar]","Missing Field","Missing Field","15/04/2021","CIB","54.38","146.51","219.34","146.51","?","10","10","10"," "," ","Avec le jeu othello, modèle cx-2600-gp"
"PS1","VideoGame",1,0,0,"Broken Sword 2 - Les Boucliers de Quetzalcoatl","Sony","Revolution Software Ltd.","22/03/2021","CIB","-1.0", "-1.0", "-1.0", "-1.0","-1.0","10","10","10"," "," ",""'
]

{ #category : #samples }
GameyeCollectionFactoryV4Test class >> exportedSpreadsheetSampleContentV4_4VideoGamesWitComplexeStringValues [
	"This game have title and developper names with coma and quotes : ""Ivan ""Ironman"" Stewart's Super Off Road"" and ""Rare, Ltd."""

	^self exportedSpreadsheetSampleHeadContentV4, '
"NES","VideoGame",1,0,0,"Ivan "Ironman" Stewart''s Super Off Road","Tradewest, Inc.","Rare, Ltd.","22/03/2021","CIB","10.85","46.64","326.48","46.64","-1.0","6","7","7"," "," ","
"Atari 2600","VideoGame",1,0,0,"Space Invaders","(null)","(null)","22/03/2021","Loose","-1.0", "-1.0", "-1.0", "-1.0","?","?","?","5"," "," ","Étiquette percée, en pack avec la console"
"NES","VideoGame",1,0,0,"Ivan "Ironman" Stewart''s Super Off Road","Tradewest, Inc.","Rare, Ltd.","22/03/2021","CIB","10.85","46.64","326.48","46.64","-1.0","6","7","7"," "," ",""
"Atari 2600","VideoGame",1,0,0,"Space Invaders","(null)","(null)","22/03/2021","Loose","-1.0", "-1.0", "-1.0", "-1.0","?","?","?","5"," "," ","Étiquette percée, en pack avec la console"'
]

{ #category : #samples }
GameyeCollectionFactoryV4Test class >> exportedSpreadsheetSampleContentV4_Empty [
	"This sample contains some frequently generated cases not easy to read/parse or exceptions due to collection evolution"

	^self exportedSpreadsheetSampleHeadContentV4
]

{ #category : #samples }
GameyeCollectionFactoryV4Test class >> exportedSpreadsheetSampleContentV4_Wishlist_1VideoGame [
	"This game have title and developper names with coma and quotes : ""Ivan ""Ironman"" Stewart's Super Off Road"" and ""Rare, Ltd."""

	^self exportedSpreadsheetSampleHeadContentV4, '
"Switch","VideoGame",0,0,1,"Advance Wars 1+2: Re-Boot Camp","Nintendo","WayForward Technologies","","Wishlist","-1.0", "-1.0", "-1.0", "-1.0","-1.0"," "," "," "," "," ",""'
]

{ #category : #accessing }
GameyeCollectionFactoryV4Test class >> exportedSpreadsheetSampleFileReferenceV4_Empty [
	<script:'self exportedSpreadsheetSampleFileReferenceV4_Empty inspect'>

	^self exportedSpreadsheetSampleFileReference: self exportedSpreadsheetSampleContentV4_Empty
]

{ #category : #accessing }
GameyeCollectionFactoryV4Test class >> exportedSpreadsheetSampleHeadContentV4 [
	"This sample contains columns head"

	^'Platform,Type,Owned,ForSale,Wishlist,Title,Publisher,Developer,DateAdded,Ownership,PriceLoose,PriceCIB,PriceNew,YourPrice,PricePaid,ItemCondition,BoxCondition,ManualCondition,Beat,PlayedCompletion,Notes'
]

{ #category : #assertions }
GameyeCollectionFactoryV4Test >> setUp [ 

	super setUp.
	gameyeVersion := GameyeVersion v4.
]

{ #category : #'tests - v4' }
GameyeCollectionFactoryV4Test >> testCreateCollectionFromExportedSpreadsheet_1Peripheral [

	| collection collectible |
	datas := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet:  (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV4_1Peripheral).

	collection := datas at: GameyeCollection owned.
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

	self assertCollectionGameyeVersion: collection.
	self assertWishAndForSellCollectionsAreEmpty: datas
]

{ #category : #'tests - v4' }
GameyeCollectionFactoryV4Test >> testCreateCollectionFromExportedSpreadsheet_1PeripheralAsAUnknownCollectible [

	| collection collectible collections |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV4_1PeripheralAsAUnknownCollectible).

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
	self assert: collectible rawDatas size equals: GameyeV4InputDataUtils numberOfExportedSpreadsheetColumns.

	self assertWishAndForSellCollectionsAreEmpty: collections
]

{ #category : #'tests - v4' }
GameyeCollectionFactoryV4Test >> testCreateCollectionFromExportedSpreadsheet_1PrintMedia [

	| collection collectible collections |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV4_1PrintMedia).

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

{ #category : #'tests - v4' }
GameyeCollectionFactoryV4Test >> testCreateCollectionFromExportedSpreadsheet_1System [

	| collectible collection |
	datas := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV4_1System).

	self createCollectionFromExportedSpreadsheet_1System.
	
	collection := datas at: GameyeCollection owned.
	collectible := collection systemsCollectibles first.
	self assert: collectible platform equals: 'Saturn'.
	self assert: collectible title equals: 'Sega Saturn Console (PAL)'.
	self assert: collectible country isNil.
	self assert: collectible releaseType isNil.
	self assert: collectible tags isNil.
]

{ #category : #'tests - v4' }
GameyeCollectionFactoryV4Test >> testCreateCollectionFromExportedSpreadsheet_1ToyToLife [

	datas := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV4_1ToyToLife).

	self createCollectionFromExportedSpreadsheet_1ToyToLife.
]

{ #category : #'tests - v4' }
GameyeCollectionFactoryV4Test >> testCreateCollectionFromExportedSpreadsheet_1VideoGameWitComplexeStringValues [

	| collection collectible collections |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV4_1VideoGameWitComplexeStringValues).

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

{ #category : #'tests - v4' }
GameyeCollectionFactoryV4Test >> testCreateCollectionFromExportedSpreadsheet_3VideoGames2SystemsWitComplexeStringValues [

	| collection collections |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV4_3VideoGames2SystemsWitComplexeStringValues).

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

{ #category : #'tests - v4' }
GameyeCollectionFactoryV4Test >> testCreateCollectionFromExportedSpreadsheet_Empty [

	| collection collections |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV4_Empty).

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

{ #category : #'tests - v4' }
GameyeCollectionFactoryV4Test >> testCreateCollectionFromExportedSpreadsheet_Wishlist_1VideoGame [

	| collections wishListCollection collection forSellCollection |
	collections := GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: (self class
		exportedSpreadsheetSampleFileReference: self class exportedSpreadsheetSampleContentV4_Wishlist_1VideoGame).

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
