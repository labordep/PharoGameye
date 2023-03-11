Class {
	#name : #GameyePrintMedia,
	#superclass : #GameyeCollectible,
	#category : #'Gameye-Model'
}

{ #category : #accessing }
GameyePrintMedia class >> type [

	^ #PrintMedia
]

{ #category : #testing }
GameyePrintMedia >> isPrintMedia [

	^ true
]
