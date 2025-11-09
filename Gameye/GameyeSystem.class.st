Class {
	#name : 'GameyeSystem',
	#superclass : 'GameyeCollectible',
	#category : 'Gameye-Model',
	#package : 'Gameye',
	#tag : 'Model'
}

{ #category : 'accessing' }
GameyeSystem class >> type [

	^ #Systems
]

{ #category : 'testing' }
GameyeSystem >> isSystem [

	^ true
]
