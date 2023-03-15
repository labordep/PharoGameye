Class {
	#name : #GameyeOwnership,
	#superclass : #Object,
	#category : #'Gameye-Model'
}

{ #category : #enumerating }
GameyeOwnership class >> CIB [

	^self completeInBox
]

{ #category : #enumerating }
GameyeOwnership class >> CIBPlus [

	^self completeInBoxPlus
]

{ #category : #enumerating }
GameyeOwnership class >> box [

	^#B
]

{ #category : #enumerating }
GameyeOwnership class >> boxAndManual [

	^self manualAndBox
]

{ #category : #enumerating }
GameyeOwnership class >> boxAndOther [

	^#'B+O'
]

{ #category : #enumerating }
GameyeOwnership class >> boxed [
	"Game + Box"

	^#Boxed
]

{ #category : #enumerating }
GameyeOwnership class >> boxedPlus [

	^#'Boxed+'
]

{ #category : #enumerating }
GameyeOwnership class >> completeInBox [

	^#CIB
]

{ #category : #enumerating }
GameyeOwnership class >> completeInBoxPlus [

	^#'CIB+'
]

{ #category : #enumerating }
GameyeOwnership class >> digital [

	^#Digital
]

{ #category : #enumerating }
GameyeOwnership class >> loose [

	^#Loose
]

{ #category : #enumerating }
GameyeOwnership class >> loosePlus [

	^#'Loose+'
]

{ #category : #enumerating }
GameyeOwnership class >> manual [

	^#M
]

{ #category : #enumerating }
GameyeOwnership class >> manualAndBox [

	^#'M+B'
]

{ #category : #enumerating }
GameyeOwnership class >> manualAndOther [

	^#'M+O'
]

{ #category : #enumerating }
GameyeOwnership class >> other [

	^#O
]

{ #category : #enumerating }
GameyeOwnership class >> otherAndBox [

	^self boxAndOther
]

{ #category : #enumerating }
GameyeOwnership class >> otherAndManual [

	^self manualAndOther
]

{ #category : #enumerating }
GameyeOwnership class >> sealed [

	^#Sealed
]

{ #category : #'see class side' }
GameyeOwnership >> seeClassSide [
]
