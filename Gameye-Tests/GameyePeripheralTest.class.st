Class {
	#name : #GameyePeripheralTest,
	#superclass : #TestCase,
	#category : #'Gameye-Tests-Model'
}

{ #category : #tests }
GameyePeripheralTest >> testConstructor [

	| peripheral |
	peripheral := GameyeCollectible type: GameyePeripheral type.
	self assert: peripheral class equals: GameyePeripheral
]

{ #category : #tests }
GameyePeripheralTest >> testInitialize [

	| peripheral |
	peripheral := GameyePeripheral new.
	self assert: peripheral type equals: GameyePeripheral type
]
