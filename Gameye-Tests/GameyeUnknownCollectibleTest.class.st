"
A GameyeUnknownCollectibleTest is a test class for testing the behavior of GameyeUnknownCollectible
"
Class {
	#name : #GameyeUnknownCollectibleTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Model'
}

{ #category : #tests }
GameyeUnknownCollectibleTest >> testConstructor [

	| unknown |
	unknown := GameyeCollectible type: GameyeUnknownCollectible type.
	self assert: unknown class equals: GameyeUnknownCollectible
]

{ #category : #tests }
GameyeUnknownCollectibleTest >> testInitialize [

	| unknown |
	unknown := GameyeUnknownCollectible new.
	self assert: unknown type equals: GameyeUnknownCollectible type
]
