"
A GameyeInputDataReaderTest is a test class for testing the behavior of GameyeInputDataReader
"
Class {
	#name : #GameyeCollectionFactoryTest,
	#superclass : #TestCase,
	#instVars : [
		'datas',
		'gameyeVersion'
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
GameyeCollectionFactoryTest >> assertCollectionGameyeVersion: aCollection [

	self assertCollection: aCollection gameyeVersion equals: gameyeVersion
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

{ #category : #'tests - common' }
GameyeCollectionFactoryTest >> createCollectionFromExportedSpreadsheet_1BadElement [
	| collection collectible |

	collection := datas at: GameyeCollection owned.
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
	self assert: collectible rawDatas notNil.
	self assert: collectible rawIndex equals: 1.

	self assertWishAndForSellCollectionsAreEmpty: datas
]

{ #category : #'tests - common' }
GameyeCollectionFactoryTest >> createCollectionFromExportedSpreadsheet_1ControllerWithTags [
	| collection collectible |

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
	self assert: collectible dateAdded equals: (Date newDay: 14 month: 8 year: 2023).
	self assert: collectible isController.

	self assertWishAndForSellCollectionsAreEmpty: datas
]

{ #category : #'tests - common' }
GameyeCollectionFactoryTest >> createCollectionFromExportedSpreadsheet_1System [
	| collection collectible  |

	collection := datas at: GameyeCollection owned.
	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection haveVideoGames equals: false.
	self assert: collection haveSystems equals: true.
	self assert: collection havePeripherals equals: false.
	self assert: collection haveToyToLife equals: false.
	self assert: collection havePrintMedias equals: false.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection systemsCollectibles first.
	self assert: collectible isSystem.
	self assert: collectible isOwned.
	self assert: collectible dateAdded equals: (Date newDay: 18 month: 7 year: 2022).
	self assert: collectible isBoxed.
	self assert: collectible priceLoose equals: 88.91.
	self assert: collectible priceCIB equals: 169.46.
	self assert: collectible priceNew equals: 381.99.
	self assert: collectible yourPrice equals: 156.75.
	self assert: collectible pricePaid equals: 139.92.
	self assert: collectible itemCondition equals: 10.
	self assert: collectible boxCondition isNil.
	self assert: collectible manualCondition equals: 10.
	self assert: collectible notes isNil.

	self assertWishAndForSellCollectionsAreEmpty: datas
]

{ #category : #'tests - common' }
GameyeCollectionFactoryTest >> createCollectionFromExportedSpreadsheet_1ToyToLife [
	| collection collectible |

	collection := datas at: GameyeCollection owned.
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

	self assertWishAndForSellCollectionsAreEmpty: datas
]

{ #category : #'tests - common' }
GameyeCollectionFactoryTest >> createCollectionFromExportedSpreadsheet_1VideoGameWitComplexeStringValues [
	| collection collectible |

	collection := datas at: GameyeCollection owned.
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

	self assertWishAndForSellCollectionsAreEmpty: datas
]

{ #category : #'tests - common' }
GameyeCollectionFactoryTest >> createCollectionFromExportedSpreadsheet_1VideoGameWitComplexeStringValues2 [
	| collection collectible |

	collection := datas at: GameyeCollection owned.
	self assert: collection date equals: (Date newDay: 20 month: 2 year: 2023).
	self assert: collection haveUnknowns equals: false.
	self assert: collection haveVideoGames equals: true.
	self assert: collection haveSystems equals: false.
	self assert: collection havePeripherals equals: false.
	self assert: collection haveToyToLife equals: false.
	self assert: collection havePrintMedias equals: false.
	self assert: collection numberOfCollectibles equals: 1.

	collectible := collection videoGamesCollectibles first.
	self assert: collectible dateAdded equals: (Date newDay: 23 month: 8 year: 2021).
	self assert: collectible isVideoGame.

	self assertWishAndForSellCollectionsAreEmpty: datas
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
