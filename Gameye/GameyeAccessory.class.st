Class {
	#name : #GameyeAccessory,
	#superclass : #GameyePeripheral,
	#category : #'Gameye-Model'
}

{ #category : #accessing }
GameyeAccessory class >> type [

	^ #GameAccessories
]

{ #category : #testing }
GameyeAccessory >> isAccessory [

	^ true
]
