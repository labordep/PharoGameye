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
		'country',
		'releaseType',
		'dateAdded',
		'ownership',
		'priceLoose',
		'priceCIB',
		'priceNew',
		'yourPrice',
		'pricePaid',
		'itemCondition',
		'boxCondition',
		'manualCondition',
		'notes',
		'tags',
		'rawDatas',
		'rawIndex'
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
	
	| symbol |
	symbol := aSymbol ifNil:[ GameyeUnknownCollectible type ].
	self allSubclassesDo: [ :c | c type = symbol ifTrue:[ ^ c new ] ].
	^ self new
]

{ #category : #converting }
GameyeCollectible >> asIdentifierString [
	"Return a value corresponding to a unique identifier string, i.e. to compare more games and detect which are the sames"

	^ String streamContents: [ :stream | self printIdentifierOn: stream ]
]

{ #category : #accessing }
GameyeCollectible >> boxCondition [

	^ boxCondition
]

{ #category : #accessing }
GameyeCollectible >> boxCondition: anObject [

	boxCondition := anObject
]

{ #category : #accessing }
GameyeCollectible >> country [

	^ country
]

{ #category : #accessing }
GameyeCollectible >> country: anObject [

	country := anObject
]

{ #category : #accessing }
GameyeCollectible >> dateAdded [

	^ dateAdded
]

{ #category : #accessing }
GameyeCollectible >> dateAdded: anObject [

	dateAdded := anObject
]

{ #category : #'testing - ownership' }
GameyeCollectible >> haveBox [

	^self isBoxed or:[self isBoxedPlus or:[self isManualAndBox or:[self isCIB or:[self isCIBPlus or:[self isSealed or:[self isBox or:[self isBoxAndOther]]]]]]]
]

{ #category : #'testing - ownership' }
GameyeCollectible >> haveManual [

	^self isManual or:[self isManualAndBox or:[self isCIB or:[self isCIBPlus or:[self isSealed or:[self isManualAndOther]]]]]
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isBox [

	^ self ownership = GameyeOwnership box
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isBoxAndManual [

	^ self isManualAndBox
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isBoxAndOther [

	^ self ownership = GameyeOwnership boxAndOther
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isBoxed [

	^ self ownership = GameyeOwnership boxed
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isBoxedPlus [

	^ self ownership = GameyeOwnership boxedPlus
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isCIB [

	^ self ownership = GameyeOwnership completeInBox
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isCIBPlus [

	^ self ownership = GameyeOwnership completeInBoxPlus
]

{ #category : #accessing }
GameyeCollectible >> isForSale [

	^ isForSale ifNil: [ isForSale := false ]
]

{ #category : #accessing }
GameyeCollectible >> isForSale: anObject [

	isForSale := anObject
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isLoose [

	^ self ownership = GameyeOwnership loose
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isLoosePlus [

	^ self ownership = GameyeOwnership loosePlus
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isManual [

	^ self ownership = GameyeOwnership manual
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isManualAndBox [

	^ self ownership = GameyeOwnership manualAndBox
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isManualAndOther [

	^ self ownership = GameyeOwnership manualAndOther
]

{ #category : #accessing }
GameyeCollectible >> isOnWishList [

	^ isOnWishList ifNil: [ isOnWishList := false ]
]

{ #category : #accessing }
GameyeCollectible >> isOnWishList: anObject [

	isOnWishList := anObject
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isOther [

	^ self ownership = GameyeOwnership other
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isOtherAndBox [

	^ self isBoxAndOther
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isOtherAndManual [

	^ self isManualAndOther
]

{ #category : #accessing }
GameyeCollectible >> isOwned [

	^ isOwned ifNil: [ isOwned := false ]
]

{ #category : #accessing }
GameyeCollectible >> isOwned: anObject [

	isOwned := anObject
]

{ #category : #'testing - type' }
GameyeCollectible >> isPeripheral [

	^ false
]

{ #category : #'testing - type' }
GameyeCollectible >> isPrintMedia [

	^ false
]

{ #category : #'testing - ownership' }
GameyeCollectible >> isSealed [

	^ (self ownership = GameyeOwnership sealed or:[self ownership = GameyeOwnership notOpen])
]

{ #category : #'testing - type' }
GameyeCollectible >> isSystem [

	^ false
]

{ #category : #'testing - type' }
GameyeCollectible >> isToyToLife [

	^ false
]

{ #category : #'testing - type' }
GameyeCollectible >> isUnknown [

	^ false
]

{ #category : #'testing - type' }
GameyeCollectible >> isVideoGame [

	^ false
]

{ #category : #accessing }
GameyeCollectible >> itemCondition [

	^ itemCondition
]

{ #category : #accessing }
GameyeCollectible >> itemCondition: anObject [

	itemCondition := anObject
]

{ #category : #accessing }
GameyeCollectible >> manualCondition [

	^ manualCondition
]

{ #category : #accessing }
GameyeCollectible >> manualCondition: anObject [

	manualCondition := anObject
]

{ #category : #accessing }
GameyeCollectible >> notes [

	^ notes
]

{ #category : #accessing }
GameyeCollectible >> notes: anObject [

	notes := anObject
]

{ #category : #accessing }
GameyeCollectible >> ownership [

	^ ownership
]

{ #category : #accessing }
GameyeCollectible >> ownership: anObject [

	ownership := anObject
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
GameyeCollectible >> priceCIB [

	^ priceCIB
]

{ #category : #accessing }
GameyeCollectible >> priceCIB: anObject [

	priceCIB := anObject
]

{ #category : #accessing }
GameyeCollectible >> priceLoose [

	^ priceLoose
]

{ #category : #accessing }
GameyeCollectible >> priceLoose: anObject [

	priceLoose := anObject
]

{ #category : #accessing }
GameyeCollectible >> priceNew [

	^ priceNew
]

{ #category : #accessing }
GameyeCollectible >> priceNew: anObject [

	priceNew := anObject
]

{ #category : #accessing }
GameyeCollectible >> pricePaid [

	^ pricePaid
]

{ #category : #accessing }
GameyeCollectible >> pricePaid: anObject [

	pricePaid := anObject
]

{ #category : #printing }
GameyeCollectible >> printIdentifierOn: aStream [

	aStream
		nextPutAll: (self title ifNil:[ '?' ]);
		nextPutAll: ' (';
		nextPutAll: (self type ifNil:[ '?' ]);
		nextPutAll: ') ';
		nextPutAll: (self platform ifNil:[ '?' ])
]

{ #category : #printing }
GameyeCollectible >> printOn: aStream [

	^self printIdentifierOn: aStream
]

{ #category : #raw }
GameyeCollectible >> rawDatas [
	"This property store the raw data of the collectible from an imported file (in case of)"

	^ rawDatas
]

{ #category : #raw }
GameyeCollectible >> rawDatas: anObject [

	rawDatas := anObject
]

{ #category : #accessing }
GameyeCollectible >> rawIndex [
	"This index is used to know what is the position of the collectible from an imported file (in case of)"
	
	^ rawIndex
]

{ #category : #accessing }
GameyeCollectible >> rawIndex: anObject [

	rawIndex := anObject
]

{ #category : #accessing }
GameyeCollectible >> releaseType [

	^ releaseType
]

{ #category : #accessing }
GameyeCollectible >> releaseType: anObject [

	releaseType := anObject
]

{ #category : #accessing }
GameyeCollectible >> tags [

	^ tags ifNil:[tags := Set new]
]

{ #category : #accessing }
GameyeCollectible >> tags: aCollection [

	tags := aCollection
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

{ #category : #accessing }
GameyeCollectible >> yourPrice [

	^ yourPrice
]

{ #category : #accessing }
GameyeCollectible >> yourPrice: anObject [

	yourPrice := anObject
]
