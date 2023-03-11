"
A GameyeCollectionTest is a test class for testing the behavior of GameyeCollection
"
Class {
	#name : #GameyeCollectionTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Model'
}

{ #category : #tests }
GameyeCollectionTest >> testAddCollectible [

	| collection |
	collection := GameyeCollection new.
	collection addCollectible: GameyeUnknownCollectible new.
	self assert: collection haveUnknowns equals: true.
	self assert: collection numberOfCollectibles equals: 1.

	"Bad cases"
	collection addCollectible: nil.
	self assert: collection haveUnknowns equals: true.
	self assert: collection numberOfCollectibles equals: 1
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
	self assert: collection date isNil.
	self assert: collection haveUnknowns equals: false.
	self assert: collection numberOfCollectibles equals: 0
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
