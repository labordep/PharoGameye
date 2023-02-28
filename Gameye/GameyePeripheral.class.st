Class {
	#name : #GameyePeripheral,
	#superclass : #GameyeCollectible,
	#category : #'Gameye-Model'
}

{ #category : #testing }
GameyePeripheral class >> isPeripheral [

	^ true
]

{ #category : #accessing }
GameyePeripheral class >> type [

	^ #Peripherals
]
