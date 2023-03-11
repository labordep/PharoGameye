"
This collectible is a not identify (unknown) collectible.
Cases should be a out of sync of the Gameye database catalog.
This collectible is not a bad read collectible, in case of a parsing/reading error the collectible is a GameyeCollectible object.
"
Class {
	#name : #GameyeUnknownCollectible,
	#superclass : #GameyeCollectible,
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
