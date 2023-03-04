Class {
	#name : #GameyeToyToLife,
	#superclass : #GameyeCollectible,
	#category : #'Gameye-Model'
}

{ #category : #accessing }
GameyeToyToLife class >> type [

	^ #ToysToLife
]

{ #category : #testing }
GameyeToyToLife >> isToyToLife [

	^ true
]
