"
GameyeCollection is a collection of GameyeCollectible
"
Class {
	#name : #GameyeCollection,
	#superclass : #Object,
	#instVars : [
		'peripherals',
		'systems',
		'toysToLife',
		'videoGames',
		'unknowns'
	],
	#category : #'Gameye-Model'
}

{ #category : #'add-remove' }
GameyeCollection >> addCollectible: aCollectible [

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
	
	self unknowns add: aCollectible
]

{ #category : #testing }
GameyeCollection >> haveUnknowns [

	^ self unknowns notEmpty
]

{ #category : #statistics }
GameyeCollection >> numberOfCollectibles [

	^ self videoGames size 
	+ self peripherals size 
	+ self toysToLife size
	+ self unknowns size
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

{ #category : #accessing }
GameyeCollection >> toysToLife [

	^ toysToLife ifNil: [ toysToLife := Set new ]
]

{ #category : #accessing }
GameyeCollection >> toysToLife: anObject [

	toysToLife := anObject
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
