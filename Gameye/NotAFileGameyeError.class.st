Class {
	#name : 'NotAFileGameyeError',
	#superclass : 'GameyeError',
	#category : 'Gameye-Error',
	#package : 'Gameye',
	#tag : 'Error'
}

{ #category : 'accessing' }
NotAFileGameyeError >> messageText [
	^ 'This element is not a file'
]
