"
A GameyeCollectibleTest is a test class for testing the behavior of GameyeCollectible
"
Class {
	#name : #GameyeCollectibleTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Model'
}

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
	self assert: collectible rawDatas isNil
]
