Class {
	#name : #GameyeCollectible,
	#superclass : #Object,
	#instVars : [
		'type',
		'platform',
		'isOwned',
		'isForSale',
		'isOnWishList',
		'title',
		'dateAdded',
		'pricePaid',
		'rawDatas'
	],
	#category : #'Gameye-Model'
}

{ #category : #testing }
GameyeCollectible class >> isAbstract [ 

	^ self = GameyeCollectible
]

{ #category : #accessing }
GameyeCollectible class >> type [

	^ #Collectible
]

{ #category : #constructor }
GameyeCollectible class >> type: aSymbol [ 
	
	self allSubclassesDo: [ :c | c type = aSymbol ifTrue:[ ^ c new ] ].
	^ self new
]

{ #category : #accessing }
GameyeCollectible >> dateAdded [

	^ dateAdded
]

{ #category : #accessing }
GameyeCollectible >> dateAdded: anObject [

	dateAdded := anObject
]

{ #category : #accessing }
GameyeCollectible >> isForSale [

	^ isForSale ifNil: [ isForSale := false ]
]

{ #category : #accessing }
GameyeCollectible >> isForSale: anObject [

	isForSale := anObject
]

{ #category : #accessing }
GameyeCollectible >> isOnWishList [

	^ isOnWishList ifNil: [ isOnWishList := false ]
]

{ #category : #accessing }
GameyeCollectible >> isOnWishList: anObject [

	isOnWishList := anObject
]

{ #category : #accessing }
GameyeCollectible >> isOwned [

	^ isOwned ifNil: [ isOwned := false ]
]

{ #category : #accessing }
GameyeCollectible >> isOwned: anObject [

	isOwned := anObject
]

{ #category : #testing }
GameyeCollectible >> isPeripheral [

	^ false
]

{ #category : #testing }
GameyeCollectible >> isPrintMedia [

	^ false
]

{ #category : #testing }
GameyeCollectible >> isSystem [

	^ false
]

{ #category : #testing }
GameyeCollectible >> isToyToLife [

	^ false
]

{ #category : #testing }
GameyeCollectible >> isUnknown [

	^ false
]

{ #category : #testing }
GameyeCollectible >> isVideoGame [

	^ false
]

{ #category : #accessing }
GameyeCollectible >> platform [

	^ platform
]

{ #category : #accessing }
GameyeCollectible >> platform: anObject [

	platform := anObject
]

{ #category : #accessing }
GameyeCollectible >> pricePaid [

	^ pricePaid
]

{ #category : #accessing }
GameyeCollectible >> pricePaid: anObject [

	pricePaid := anObject
]

{ #category : #raw }
GameyeCollectible >> rawDatas [

	^ rawDatas
]

{ #category : #raw }
GameyeCollectible >> rawDatas: anObject [

	rawDatas := anObject
]

{ #category : #accessing }
GameyeCollectible >> title [

	^ title
]

{ #category : #accessing }
GameyeCollectible >> title: anObject [

	title := anObject
]

{ #category : #accessing }
GameyeCollectible >> type [

	^ type ifNil: [ type := self class type ]
]
