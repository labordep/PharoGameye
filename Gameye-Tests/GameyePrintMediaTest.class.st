Class {
	#name : #GameyePrintMediaTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Model'
}

{ #category : #tests }
GameyePrintMediaTest >> testConstructor [

	| printMedia |
	printMedia := GameyeCollectible type: GameyePrintMedia type.
	self assert: printMedia class equals: GameyePrintMedia
]

{ #category : #tests }
GameyePrintMediaTest >> testInitialize [

	| printMedia |
	printMedia := GameyePrintMedia new.
	self assert: printMedia type equals: GameyePrintMedia type
]
