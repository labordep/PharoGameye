Class {
	#name : #GameyePeripheral,
	#superclass : #GameyeCollectible,
	#category : #'Gameye-Model'
}

{ #category : #accessing }
GameyePeripheral class >> type [

	^ #Peripherals
]

{ #category : #testing }
GameyePeripheral >> isAccessory [

	^ false
]

{ #category : #testing }
GameyePeripheral >> isController [

	^ false
]

{ #category : #testing }
GameyePeripheral >> isPeripheral [

	^ true
]
