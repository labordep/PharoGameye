Class {
	#name : #GameyeExamples,
	#superclass : #Object,
	#category : #'Gameye-Examples'
}

{ #category : #'1 - load datas' }
GameyeExamples class >> loadExportedSpreadsheet [
	"Open a file browser and load a .csv file exported with the application"
	<script>
	
	| fileReference |
	"Cannot known to open a native OS file dialog, so use the pharo not very praticle file dialog :("
	fileReference := UIManager default chooseExistingFileReference: nil extensions: #('csv') path: FileSystem workingDirectory.
	fileReference ifNil:[ ^ self ].

	(GameyeCollectionFactory createCollectionsFromExportedSpreadsheet: fileReference) inspect.
]

{ #category : #'see class side' }
GameyeExamples >> seeClassSide [
]
