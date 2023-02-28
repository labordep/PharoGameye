Class {
	#name : #GameyeCollectible,
	#superclass : #Object,
	#instVars : [
		'type',
		'platform',
		'isOwned',
		'isForSale',
		'isOnWishList',
		'title'
	],
	#category : #'Gameye-Model'
}

{ #category : #testing }
GameyeCollectible class >> isPeripheral [

	^ false
]

{ #category : #testing }
GameyeCollectible class >> isSystem [

	^ false
]

{ #category : #testing }
GameyeCollectible class >> isToyToLife [

	^ false
]

{ #category : #testing }
GameyeCollectible class >> isVideoGame [

	^ false
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

{ #category : #accessing }
GameyeCollectible >> platform [

	^ platform
]

{ #category : #accessing }
GameyeCollectible >> platform: anObject [

	platform := anObject
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
