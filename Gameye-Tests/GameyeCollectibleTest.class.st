"
A GameyeCollectibleTest is a test class for testing the behavior of GameyeCollectible
"
Class {
	#name : #GameyeCollectibleTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Model'
}

{ #category : #tests }
GameyeCollectibleTest >> testAsIdentifierString [

	| collectible |
	collectible := GameyeCollectible new.
	self assert: collectible asIdentifierString
		equals: 'Collectible-Unknown Title-Unknown Platform'.

	collectible title: 'TestTitle'.
	self assert: collectible asIdentifierString
		equals: 'Collectible-TestTitle-Unknown Platform'.

	collectible platform: 'TestPlatform'.
	self assert: collectible asIdentifierString
		equals: 'Collectible-TestTitle-TestPlatform'
]

{ #category : #tests }
GameyeCollectibleTest >> testDateAdded [

	| collectible |
	collectible := GameyeCollectible new.
	collectible dateAdded: (Date newDay: 21 month: 1 year: 2023).
	self assert: collectible dateAdded equals:  (Date newDay: 21 month: 1 year: 2023)
]

{ #category : #tests }
GameyeCollectibleTest >> testHaveBox [

	| collectible |
	collectible := GameyeCollectible new.

	"True cases"
	collectible ownership: GameyeOwnership box.
	self assert: collectible haveBox equals: true.
	
	collectible ownership: GameyeOwnership boxAndOther.
	self assert: collectible haveBox equals: true.
	
	collectible ownership: GameyeOwnership boxed.
	self assert: collectible haveBox equals: true.

	collectible ownership: GameyeOwnership boxedPlus.
	self assert: collectible haveBox equals: true.

	collectible ownership: GameyeOwnership manualAndBox.
	self assert: collectible haveBox equals: true.

	collectible ownership: GameyeOwnership completeInBox.
	self assert: collectible haveBox equals: true.

	collectible ownership: GameyeOwnership completeInBoxPlus.
	self assert: collectible haveBox equals: true.

	collectible ownership: GameyeOwnership sealed.
	self assert: collectible haveBox equals: true.

	"False cases"
	collectible ownership: GameyeOwnership loose.
	self assert: collectible haveBox equals: false.

	collectible ownership: GameyeOwnership loosePlus.
	self assert: collectible haveBox equals: false.

	collectible ownership: GameyeOwnership manual.
	self assert: collectible haveBox equals: false.

	collectible ownership: GameyeOwnership other.
	self assert: collectible haveBox equals: false
]

{ #category : #tests }
GameyeCollectibleTest >> testHaveManual [

	| collectible |
	collectible := GameyeCollectible new.

	"True cases"
	collectible ownership: GameyeOwnership manual.
	self assert: collectible haveManual equals: true.

	"collectible ownership: GameyeOwnership loosePlus.
	self assert: collectible haveManual equals: true." 
	self flag:'PLA : Loose plus is a problem because there is no way to knows if the "plus" is a manual or other...'.

	collectible ownership: GameyeOwnership manualAndBox.
	self assert: collectible haveManual equals: true.

	collectible ownership: GameyeOwnership manualAndOther.
	self assert: collectible haveManual equals: true.

	collectible ownership: GameyeOwnership completeInBox.
	self assert: collectible haveManual equals: true.

	collectible ownership: GameyeOwnership completeInBoxPlus.
	self assert: collectible haveManual equals: true.

	collectible ownership: GameyeOwnership sealed.
	self assert: collectible haveManual equals: true.

	"False cases"
	collectible ownership: GameyeOwnership boxed.
	self assert: collectible haveManual equals: false.

	collectible ownership: GameyeOwnership boxedPlus.
	self assert: collectible haveManual equals: false.

	collectible ownership: GameyeOwnership loose.
	self assert: collectible haveManual equals: false.

	collectible ownership: GameyeOwnership other.
	self assert: collectible haveManual equals: false
]

{ #category : #tests }
GameyeCollectibleTest >> testInitialize [

	| collectible |
	collectible := GameyeCollectible new.
	self assert: collectible type equals: GameyeCollectible type.
	self assert: collectible platform isNil.
	self assert: collectible isOwned equals: false.
	self assert: collectible isForSale equals: false.
	self assert: collectible isOnWishList equals: false.
	self assert: collectible title isNil.
	self assert: collectible dateAdded isNil.

	self assert: collectible priceLoose isNil.
	self assert: collectible priceCIB isNil.
	self assert: collectible priceNew isNil.
	self assert: collectible yourPrice isNil.
	self assert: collectible pricePaid isNil.

	self assert: collectible notes isNil.
	self assert: collectible tags isEmpty.
	
	"Raw datas : in case of problems"
	self assert: collectible rawDatas isNil.
	self assert: collectible rawIndex isNil.

	"Ownership"
	self assert: collectible haveBox equals: false.
	self assert: collectible haveManual equals: false.
	self assert: collectible isBoxed equals: false.
	self assert: collectible isBoxedPlus equals: false.
	self assert: collectible isCIB equals: false.
	self assert: collectible isCIBPlus equals: false.
	self assert: collectible isLoose equals: false.
	self assert: collectible isLoosePlus equals: false.
	self assert: collectible isManual equals: false.
	self assert: collectible isManualAndBox equals: false.
	self assert: collectible isOther equals: false.
	self assert: collectible isSealed equals: false
]

{ #category : #tests }
GameyeCollectibleTest >> testIsCIB [

	| collectible |
	collectible := GameyeCollectible new.
	collectible ownership: GameyeOwnership completeInBox.
	self assert: collectible isCIB
]

{ #category : #tests }
GameyeCollectibleTest >> testIsForSale [

	| collectible |
	collectible := GameyeCollectible new.
	collectible isForSale: true.
	self assert: collectible isForSale
]

{ #category : #tests }
GameyeCollectibleTest >> testIsLoose [

	| collectible |
	collectible := GameyeCollectible new.
	collectible ownership: GameyeOwnership loose.
	self assert: collectible isLoose
]

{ #category : #tests }
GameyeCollectibleTest >> testIsOnWishList [

	| collectible |
	collectible := GameyeCollectible new.
	collectible isOnWishList: true.
	self assert: collectible isOnWishList
]

{ #category : #tests }
GameyeCollectibleTest >> testIsOwned [

	| collectible |
	collectible := GameyeCollectible new.
	collectible isOwned: true.
	self assert: collectible isOwned
]

{ #category : #tests }
GameyeCollectibleTest >> testIsSealed [

	| collectible |
	collectible := GameyeCollectible new.
	collectible ownership: GameyeOwnership sealed.
	self assert: collectible isSealed
]

{ #category : #tests }
GameyeCollectibleTest >> testNotes [

	| collectible |
	collectible := GameyeCollectible new.
	collectible notes: 'Test
notes'.
	self assert: collectible notes equals: 'Test
notes'
]

{ #category : #tests }
GameyeCollectibleTest >> testOwnership [

	| collectible |
	collectible := GameyeCollectible new.
	collectible ownership: 'CIB'.
	self assert: collectible ownership equals: 'CIB'
]

{ #category : #tests }
GameyeCollectibleTest >> testPlatform [

	| collectible |
	collectible := GameyeCollectible new.
	collectible platform: 'TestPlatform'.
	self assert: collectible platform equals: 'TestPlatform'
]

{ #category : #tests }
GameyeCollectibleTest >> testPrintString [

	| collectible |
	collectible := GameyeCollectible new.
	self assert: collectible printString equals: collectible asIdentifierString
]

{ #category : #tests }
GameyeCollectibleTest >> testTags [

	| collectible tag1 tag2 |
	collectible := GameyeCollectible new.
	tag1 := #tag1.
	tag2 := #tag2.
	collectible tags add: tag1.
	collectible tags add: tag2.	
	self assert: collectible tags size equals: 2.
	self assert: (collectible tags includes: tag1).
	self assert: (collectible tags includes: tag2).
	
	collectible tags remove: tag1.
	self assert: collectible tags size equals: 1.
	self assert: (collectible tags includes: tag2).
]

{ #category : #tests }
GameyeCollectibleTest >> testTitle [

	| collectible |
	collectible := GameyeCollectible new.
	collectible title: 'TestGame'.
	self assert: collectible title equals: 'TestGame'
]
