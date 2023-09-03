Class {
	#name : #GameyeAccessory,
	#superclass : #GameyePeripheral,
	#category : #'Gameye-Model'
}

{ #category : #accessing }
GameyeAccessory class >> type [

	^ #'Game Accessories'
]

{ #category : #testing }
GameyeAccessory >> isAccessory [

	^ true
]
