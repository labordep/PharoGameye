"
This collectible is a not identify (unknown) collectible.
This should be a bad stream read (when trying to import Gameye datas file) or a removed collectible from the main gameye database catalog.
"
Class {
	#name : #GameyeUnknownCollectible,
	#superclass : #GameyeCollectible,
	#instVars : [
		'rawDatas'
	],
	#category : #'Gameye-Model'
}

{ #category : #accessing }
GameyeUnknownCollectible class >> type [

	^ #?
]

{ #category : #testing }
GameyeUnknownCollectible >> isUnknown [

	^ true
]

{ #category : #accessing }
GameyeUnknownCollectible >> rawDatas [

	^ rawDatas
]

{ #category : #accessing }
GameyeUnknownCollectible >> rawDatas: anObject [

	rawDatas := anObject
]
