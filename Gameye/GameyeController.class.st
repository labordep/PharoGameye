Class {
	#name : #GameyeController,
	#superclass : #GameyePeripheral,
	#category : #'Gameye-Model'
}

{ #category : #accessing }
GameyeController class >> type [

	^ #Controllers
]

{ #category : #testing }
GameyeController >> isController [

	^ true
]
