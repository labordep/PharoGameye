"
A GameyeCollectionTest is a test class for testing the behavior of GameyeCollection
"
Class {
	#name : #GameyeCollectionTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Model'
}

{ #category : #utils }
GameyeCollectionTest class >> createOwnedCollection [
	"Create a test collection with owned collectibles"

	| collection |
	collection := GameyeCollection new.
	collection name: 'OwnedTestCollection'.
	collection addCollectible: (GameyeVideoGame new title: 'Game1'; platform: 'N64'; country: #'United States of America'; developer: 'Nintendo'; publisher: 'Nintendo'; dateAdded: (Date newDay: 21 month: 1 year: 2023); pricePaid: 5).
	collection addCollectible: (GameyeVideoGame new title: 'Game2'; platform: 'PS2'; country: #'United Kingdom'; developer: 'Sony'; publisher: 'Sony'; dateAdded: (Date newDay: 21 month: 1 year: 2023); pricePaid: 0).
	collection addCollectible: (GameyeVideoGame new title: 'Game3'; platform: 'Xbox 360'; country: #'Japan'; developer: 'Microsoft'; publisher: 'Microsoft'; dateAdded: (Date newDay: 21 month: 1 year: 2023); pricePaid: 5).
	collection addCollectible: (GameyeVideoGame new title: 'Game4'; platform: 'Jaguar'; developer: 'Atari'; publisher: 'Atari'; dateAdded: (Date newDay: 21 month: 1 year: 2023); pricePaid: nil).
	collection addCollectible: (GameyeVideoGame new title: 'Game5'; platform: 'CD-i'; developer: 'Philips'; publisher: 'Philips'; dateAdded: (Date newDay: 21 month: 1 year: 2023); pricePaid: 5).

	collection collectibles do:[ :c | c isOwned: true ].

	^collection
]

{ #category : #tests }
GameyeCollectionTest >> testAddCollectible [

	| collection |
	collection := GameyeCollection new.
	collection addCollectible: GameyeUnknownCollectible new.
	self assert: collection haveUnknowns equals: true.
	self assert: collection numberOfCollectibles equals: 1.
	self assert: collection collectibles size equals: 1.

	"Bad cases"
	collection addCollectible: nil.
	self assert: collection haveUnknowns equals: true.
	self assert: collection numberOfCollectibles equals: 1.
]

{ #category : #tests }
GameyeCollectionTest >> testAddSameCollectible [

	| collection duplicated size |
	collection := self class createOwnedCollection.
	size := collection numberOfVideoGames.
	duplicated := collection videoGamesCollectibles first.
	1 to: 5 do:[ :i |
		collection addCollectible: duplicated.
	].
	self assert: collection videoGamesCollectibles size equals: size.
]

{ #category : #tests }
GameyeCollectionTest >> testCollectibles [

	| collection |
	collection := self class createOwnedCollection.
	self assert: collection collectibles size equals: 5.
]

{ #category : #tests }
GameyeCollectionTest >> testDate [

	| collection |
	collection := GameyeCollection new.
	collection date: (Date newDay: 1 month: 5 year: 2021).
	self assert: collection date equals: (Date newDay: 1 month: 5 year: 2021)
]

{ #category : #tests }
GameyeCollectionTest >> testDuplicatedPeripherals [

	| collection |
	collection := self class createOwnedCollection.
	self assert: collection duplicatedPeripherals isEmpty.
]

{ #category : #tests }
GameyeCollectionTest >> testDuplicatedSystems [

	| collection |
	collection := self class createOwnedCollection.
	self assert: collection duplicatedSystems isEmpty.
]

{ #category : #tests }
GameyeCollectionTest >> testDuplicatedVideoGames [

	| collection duplicated |
	collection := self class createOwnedCollection.
	self assert: collection duplicatedVideoGames isEmpty.

	duplicated := collection videoGamesCollectibles first.
	1 to: 5 do:[ :i |
		collection addCollectible: duplicated copy.
	].
	self assert: collection duplicatedVideoGames size equals: 6.
]

{ #category : #tests }
GameyeCollectionTest >> testGameyeVersion [

	| collection |
	collection := GameyeCollection new.
	collection gameyeVersion: GameyeVersion v4.
	self assert: collection gameyeVersion equals: GameyeVersion v4
]

{ #category : #tests }
GameyeCollectionTest >> testIncludesCollectible [

	| collection collectible |
	collectible := GameyeVideoGame new.
	collection := GameyeCollection new.

	self assert: (collection includesCollectible: collectible) equals: false.

	collection addCollectible: collectible.
	self assert: (collection includesCollectible: collectible).

	"Bad cases"
	self assert: (collection includesCollectible: nil) equals: false
]

{ #category : #tests }
GameyeCollectionTest >> testInitialize [

	| collection |
	collection := GameyeCollection new.
	self assert: collection name isNil.
	self assert: collection date isNil.
	self assert: collection gameyeVersion equals: GameyeVersion unknown.
	self assert: collection haveUnknowns equals: false.
	self assert: collection haveVideoGames equals: false.
	self assert: collection haveSystems equals: false.
	self assert: collection havePeripherals equals: false.
	self assert: collection haveToyToLife equals: false.
	self assert: collection havePrintMedias equals: false.
	self assert: collection numberOfCollectibles equals: 0.
	self assert: collection collectibles size equals: 0
]

{ #category : #tests }
GameyeCollectionTest >> testName [

	| collection |
	collection := GameyeCollection new.
	collection name: 'MyCollection'.
	self assert: collection name equals: 'MyCollection'
]

{ #category : #tests }
GameyeCollectionTest >> testNumberOfCollectibles [

	| collection |
	collection := self class createOwnedCollection.
	self assert: collection numberOfCollectibles equals: 5
]

{ #category : #tests }
GameyeCollectionTest >> testNumberOfVideoGames [

	| collection |
	collection := self class createOwnedCollection.
	self assert: collection numberOfVideoGames equals: 5
]

{ #category : #tests }
GameyeCollectionTest >> testPeripheralsCollectibles [

	| collectible collection |
	collectible := GameyePeripheral new.
	collection := GameyeCollection new.
	collection addCollectible: collectible.
	self assert: collection peripheralsCollectibles size equals: 1.
	self assert: collection peripheralsCollectibles first equals: collectible
]

{ #category : #tests }
GameyeCollectionTest >> testPricePaid [

	| collection |
	collection := self class createOwnedCollection.
	self assert: collection pricePaid equals: 15
]

{ #category : #tests }
GameyeCollectionTest >> testPrintMediasCollectibles [

	| collectible collection |
	collectible := GameyePrintMedia new.
	collection := GameyeCollection new.
	collection addCollectible: collectible.
	self assert: collection printMediasCollectibles size equals: 1.
	self assert: collection printMediasCollectibles first equals: collectible
]

{ #category : #tests }
GameyeCollectionTest >> testRemoveCollectible [

	| collection collectible |
	collectible := GameyeCollectible new.
	collection := GameyeCollection new.

	collection addCollectible: collectible.
	collection removeCollectible: collectible.
	self assert: collection haveUnknowns equals: false.
	self assert: collection numberOfCollectibles equals: 0.
	self assert: collection collectibles size equals: 0.

	"Bad cases"
	collection removeCollectible: collectible.
	self assert: collection haveUnknowns equals: false.
	self assert: collection numberOfCollectibles equals: 0.

	collection removeCollectible: nil.
	self assert: collection haveUnknowns equals: false.
	self assert: collection numberOfCollectibles equals: 0
]

{ #category : #tests }
GameyeCollectionTest >> testSystemsCollectibles [

	| collectible collection |
	collectible := GameyeSystem new.
	collection := GameyeCollection new.
	collection addCollectible: collectible.
	self assert: collection systemsCollectibles size equals: 1.
	self assert: collection systemsCollectibles first equals: collectible
]

{ #category : #tests }
GameyeCollectionTest >> testToysToLifeCollectibles [

	| collectible collection |
	collectible := GameyeToyToLife new.
	collection := GameyeCollection new.
	collection addCollectible: collectible.
	self assert: collection toysToLifeCollectibles size equals: 1.
	self assert: collection toysToLifeCollectibles first equals: collectible
]

{ #category : #tests }
GameyeCollectionTest >> testUnknownsCollectibles [

	| collectible collection |
	collectible := GameyeUnknownCollectible new.
	collection := GameyeCollection new.
	collection addCollectible: collectible.
	self assert: collection unknownsCollectibles size equals: 1.
	self assert: collection unknownsCollectibles first equals: collectible
]

{ #category : #tests }
GameyeCollectionTest >> testVideoGamesCollectibles [

	| collectible collection |
	collectible := GameyeVideoGame new.
	collection := GameyeCollection new.
	collection addCollectible: collectible.
	self assert: collection videoGamesCollectibles size equals: 1.
	self assert: collection videoGamesCollectibles first equals: collectible
]

{ #category : #tests }
GameyeCollectionTest >> testVideoGamesForCountry [

	| collection n64Games |
	collection := self class createOwnedCollection.
	n64Games := collection videoGamesForCountry: #'United Kingdom'.
	self assert: n64Games size equals: 1.
	self assert: n64Games first country equals: #'United Kingdom'
]

{ #category : #tests }
GameyeCollectionTest >> testVideoGamesForDeveloper [

	| collection n64Games |
	collection := self class createOwnedCollection.
	n64Games := collection videoGamesForDeveloper: 'Nintendo'.
	self assert: n64Games size equals: 1.
	self assert: n64Games first developer equals: 'Nintendo'
]

{ #category : #tests }
GameyeCollectionTest >> testVideoGamesForPlatform [

	| collection n64Games |
	collection := self class createOwnedCollection.
	n64Games := collection videoGamesForPlatform: 'N64'.
	self assert: n64Games size equals: 1.
	self assert: n64Games first platform equals: 'N64'
]

{ #category : #tests }
GameyeCollectionTest >> testVideoGamesForPublisher [

	| collection n64Games |
	collection := self class createOwnedCollection.
	n64Games := collection videoGamesForPublisher: 'Nintendo'.
	self assert: n64Games size equals: 1.
	self assert: n64Games first publisher equals: 'Nintendo'
]

{ #category : #tests }
GameyeCollectionTest >> testYourPrice [

	| collection |
	collection := self class createOwnedCollection.
	self assert: collection yourPrice equals: 0
]
