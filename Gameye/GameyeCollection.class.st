"
GameyeCollection is a collection of GameyeCollectible
"
Class {
	#name : #GameyeCollection,
	#superclass : #Object,
	#instVars : [
		'name',
		'date',
		'gameyeVersion',
		'peripherals',
		'systems',
		'toysToLife',
		'videoGames',
		'printMedias',
		'unknowns'
	],
	#category : #'Gameye-Model'
}

{ #category : #enumerating }
GameyeCollection class >> forSell [ 

	^#forSell
]

{ #category : #enumerating }
GameyeCollection class >> owned [ 

	^#owned
]

{ #category : #enumerating }
GameyeCollection class >> wish [ 

	^#wish
]

{ #category : #'collectibles - add-remove' }
GameyeCollection >> addCollectible: aCollectible [

	aCollectible ifNil: [ ^ self ].
	aCollectible isVideoGame ifTrue: [
		self videoGames add: aCollectible.
		^ self ].
	aCollectible isSystem ifTrue: [
		self systems add: aCollectible.
		^ self ].
	aCollectible isPeripheral ifTrue: [
		self peripherals add: aCollectible.
		^ self ].
	aCollectible isToyToLife ifTrue: [
		self toysToLife add: aCollectible.
		^ self ].
	aCollectible isPrintMedia ifTrue: [
		self printMedias add: aCollectible.
		^ self ].

	aCollectible isUnknown ifFalse: [ ^ self ].
	self unknowns add: aCollectible.
	^ self
]

{ #category : #'collectibles - get' }
GameyeCollection >> collectibles [
	"Return all collectibles"

	| collectibles |
	collectibles := OrderedCollection new.
	collectibles addAll: self videoGames.
	collectibles addAll: self systems.
	collectibles addAll: self peripherals.
	collectibles addAll: self toysToLife.
	collectibles addAll: self printMedias.
	collectibles addAll: self unknowns.
	^collectibles
]

{ #category : #'collectibles - query' }
GameyeCollection >> collectiblesForPlatform: aString [

	^ self collectibles select:[ :c | c platform = aString ]
]

{ #category : #'collectibles - query' }
GameyeCollection >> collectiblesForTitle: aString [

	^ self collectibles select:[ :c | c title = aString ]
]

{ #category : #accessing }
GameyeCollection >> date [

	^ date
]

{ #category : #accessing }
GameyeCollection >> date: aDate [

	date := aDate
]

{ #category : #private }
GameyeCollection >> duplicated: aCollectibleList [

	| identifiers duplicated |
	identifiers := Dictionary new.
	aCollectibleList do:[ :collectible | | identifier coll |
		identifier := collectible asIdentifierString.
		(identifiers includesKey: identifier) ifTrue:[
			coll := identifiers at: identifier.
			coll add: collectible.
		] ifFalse:[
			identifiers at: identifier put: (OrderedCollection with: collectible).
		].
	].

	duplicated := OrderedCollection new.
	identifiers values select:[ :coll | coll size > 1 ] thenDo:[ :coll | duplicated addAll: coll ].
	^ duplicated
]

{ #category : #'collectibles - query' }
GameyeCollection >> duplicatedPeripherals [

	^ self duplicated: self peripheralsCollectibles
]

{ #category : #'collectibles - query' }
GameyeCollection >> duplicatedSystems [

	^ self duplicated: self systemsCollectibles
]

{ #category : #'collectibles - query' }
GameyeCollection >> duplicatedVideoGames [

	^ self duplicated: self videoGamesCollectibles
]

{ #category : #accessing }
GameyeCollection >> gameyeVersion [

	^ gameyeVersion ifNil: [ gameyeVersion := GameyeVersion unknown ]
]

{ #category : #accessing }
GameyeCollection >> gameyeVersion: anObject [

	gameyeVersion := anObject
]

{ #category : #testing }
GameyeCollection >> havePeripherals [

	^ self peripherals notEmpty
]

{ #category : #testing }
GameyeCollection >> havePrintMedias [

	^ self printMedias notEmpty
]

{ #category : #testing }
GameyeCollection >> haveSystems [

	^ self systems notEmpty
]

{ #category : #testing }
GameyeCollection >> haveToyToLife [

	^ self toysToLife notEmpty
]

{ #category : #testing }
GameyeCollection >> haveUnknowns [

	^ self unknowns notEmpty
]

{ #category : #testing }
GameyeCollection >> haveVideoGames [

	^ self videoGames notEmpty
]

{ #category : #'collectibles - get' }
GameyeCollection >> includesCollectible: aCollectible [

	aCollectible ifNil:[ ^ false ].

	aCollectible isVideoGame ifTrue: [
		^ self videoGames includes: aCollectible.
	].

	aCollectible isSystem ifTrue: [
		^ self systems includes: aCollectible.
	].

	aCollectible isPeripheral ifTrue: [
		^ self peripherals includes: aCollectible.
	].

	aCollectible isToyToLife ifTrue: [
		^ self toysToLife includes: aCollectible.
	].

	aCollectible isUnknown ifTrue: [
		^ self unknowns includes: aCollectible.
	].

	^ false
]

{ #category : #accessing }
GameyeCollection >> name [

	^ name
]

{ #category : #accessing }
GameyeCollection >> name: anObject [

	name := anObject
]

{ #category : #statistics }
GameyeCollection >> numberOfCollectibles [
	"Cannot return errors collectibles to detect errors when counting"

	^ self videoGames size
	+ self systems size
	+ self peripherals size
	+ self toysToLife size
	+ self printMedias size
	+ self unknowns size
]

{ #category : #statistics }
GameyeCollection >> numberOfVideoGames [

	^ self videoGames size
]

{ #category : #accessing }
GameyeCollection >> peripherals [

	^ peripherals ifNil: [ peripherals := Set new ]
]

{ #category : #accessing }
GameyeCollection >> peripherals: anObject [

	peripherals := anObject
]

{ #category : #'collectibles - get' }
GameyeCollection >> peripheralsCollectibles [

	^self peripherals asOrderedCollection
]

{ #category : #'collectibles - query' }
GameyeCollection >> peripheralsForPlatform: aString [

	^ self peripheralsCollectibles select:[ :c | c platform = aString ]
]

{ #category : #'collectibles - query - ownership' }
GameyeCollection >> peripheralsOwnership: aGameyeOwnership [

	^ self peripheralsCollectibles select:[ :c | c ownership = aGameyeOwnership ]
]

{ #category : #statistics }
GameyeCollection >> pricePaid [
	"Return price paid for all collectibles"
	| price |
	price := 0.
	self collectibles do: [ :c | c pricePaid ifNotNil:[ :p | price := price + p ] ].
	^ price
]

{ #category : #accessing }
GameyeCollection >> printMedias [

	^ printMedias ifNil: [ printMedias := Set new ]
]

{ #category : #accessing }
GameyeCollection >> printMedias: anObject [

	printMedias := anObject
]

{ #category : #'collectibles - get' }
GameyeCollection >> printMediasCollectibles [

	^self printMedias asOrderedCollection
]

{ #category : #'collectibles - add-remove' }
GameyeCollection >> removeCollectible: aCollectible [

	aCollectible ifNil: [ ^ self ].
	aCollectible isVideoGame ifTrue: [
		self videoGames remove: aCollectible ifAbsent: [ nil ].
		^ self ].
	aCollectible isSystem ifTrue: [
		self systems remove: aCollectible ifAbsent: [ nil ].
		^ self ].
	aCollectible isPeripheral ifTrue: [
		self peripherals remove: aCollectible ifAbsent: [ nil ].
		^ self ].
	aCollectible isToyToLife ifTrue: [
		self toysToLife remove: aCollectible ifAbsent: [ nil ].
		^ self ].
	aCollectible isPrintMedia ifTrue: [
		self printMedias remove: aCollectible ifAbsent: [ nil ].
		^ self ].

	aCollectible isUnknown ifFalse: [ ^ self ].
	self unknowns remove: aCollectible ifAbsent: [ nil ].
	^ self
]

{ #category : #'collectibles - query - ownership' }
GameyeCollection >> sealedPeripherals [

	^ self peripheralsOwnership: GameyeOwnership sealed
]

{ #category : #'collectibles - query - ownership' }
GameyeCollection >> sealedSystems [

	^ self systemsOwnership: GameyeOwnership sealed
]

{ #category : #'collectibles - query - ownership' }
GameyeCollection >> sealedToysToLife [

	^ self toysToLifeOwnership: GameyeOwnership sealed
]

{ #category : #'collectibles - query - ownership' }
GameyeCollection >> sealedVideoGames [

	^ self videoGamesOwnership: GameyeOwnership sealed
]

{ #category : #accessing }
GameyeCollection >> systems [

	^ systems ifNil: [ systems := Set new ]
]

{ #category : #accessing }
GameyeCollection >> systems: anObject [

	systems := anObject
]

{ #category : #'collectibles - get' }
GameyeCollection >> systemsCollectibles [

	^self systems asOrderedCollection
]

{ #category : #'collectibles - query' }
GameyeCollection >> systemsForPlatform: aString [

	^ self systemsCollectibles select:[ :c | c platform = aString ]
]

{ #category : #'collectibles - query - ownership' }
GameyeCollection >> systemsOwnership: aGameyeOwnership [

	^ self systemsCollectibles select:[ :c | c ownership = aGameyeOwnership ]
]

{ #category : #accessing }
GameyeCollection >> toysToLife [

	^ toysToLife ifNil: [ toysToLife := Set new ]
]

{ #category : #accessing }
GameyeCollection >> toysToLife: anObject [

	toysToLife := anObject
]

{ #category : #'collectibles - get' }
GameyeCollection >> toysToLifeCollectibles [

	^self toysToLife asOrderedCollection
]

{ #category : #'collectibles - query - ownership' }
GameyeCollection >> toysToLifeOwnership: aGameyeOwnership [

	^ self toysToLifeCollectibles select:[ :c | c ownership = aGameyeOwnership ]
]

{ #category : #accessing }
GameyeCollection >> unknowns [

	^ unknowns ifNil: [ unknowns := Set new ]
]

{ #category : #accessing }
GameyeCollection >> unknowns: anObject [

	unknowns := anObject
]

{ #category : #'collectibles - get' }
GameyeCollection >> unknownsCollectibles [

	^self unknowns asOrderedCollection
]

{ #category : #accessing }
GameyeCollection >> videoGames [

	^ videoGames ifNil: [ videoGames := Set new ]
]

{ #category : #accessing }
GameyeCollection >> videoGames: anObject [

	videoGames := anObject
]

{ #category : #'collectibles - get' }
GameyeCollection >> videoGamesCollectibles [

	^self videoGames asOrderedCollection
]

{ #category : #'collectibles - query' }
GameyeCollection >> videoGamesForDeveloper: aString [

	^ self videoGamesCollectibles select:[ :c | c developer = aString ]
]

{ #category : #'collectibles - query' }
GameyeCollection >> videoGamesForPlatform: aString [

	^ self videoGamesCollectibles select:[ :c | c platform = aString ]
]

{ #category : #'collectibles - query' }
GameyeCollection >> videoGamesForPublisher: aString [

	^ self videoGamesCollectibles select:[ :c | c publisher = aString ]
]

{ #category : #'collectibles - query - ownership' }
GameyeCollection >> videoGamesOwnership: aGameyeOwnership [

	^ self videoGamesCollectibles select:[ :c | c ownership = aGameyeOwnership ]
]

{ #category : #statistics }
GameyeCollection >> yourPrice [
	"Return price estimation (your price) of all the collectibles"
	| price |
	price := 0.
	self collectibles do: [ :c | c yourPrice ifNotNil:[ :p | price := price + p ] ].
	^ price
]
