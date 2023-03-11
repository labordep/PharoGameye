Class {
	#name : #GameyeSystemTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Model'
}

{ #category : #tests }
GameyeSystemTest >> testConstructor [

	| system |
	system := GameyeCollectible type: GameyeSystem type.
	self assert: system class equals: GameyeSystem.
]

{ #category : #tests }
GameyeSystemTest >> testInitialize [

	| system |
	system := GameyeSystem new.
	self assert: system type equals: GameyeSystem type.
]
