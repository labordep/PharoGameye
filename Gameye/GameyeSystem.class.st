Class {
	#name : #GameyeSystem,
	#superclass : #GameyeCollectible,
	#category : #'Gameye-Model'
}

{ #category : #accessing }
GameyeSystem class >> type [

	^ #Systems
]

{ #category : #testing }
GameyeSystem >> isSystem [

	^ true
]
