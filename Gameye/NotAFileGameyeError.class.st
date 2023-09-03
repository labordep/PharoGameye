Class {
	#name : #NotAFileGameyeError,
	#superclass : #GameyeError,
	#category : #'Gameye-Error'
}

{ #category : #accessing }
NotAFileGameyeError >> messageText [
	^ 'This element is not a file'
]
