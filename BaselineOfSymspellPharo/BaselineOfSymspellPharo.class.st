Class {
	#name : 'BaselineOfSymspellPharo',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSymspellPharo',
	#package : 'BaselineOfSymspellPharo'
}

{ #category : 'baselines' }
BaselineOfSymspellPharo >> baselineOf: spec [

	spec for: #common do: [
		spec
			baseline: 'Hashtable'
			with: [
			spec repository: 'github://pharo-containers/Hashtable:v1.x.x/src' ].
		spec package: 'Symspell-Pharo' with: [ spec requires: #( 'Hashtable' ) ].
		spec
			package: 'Symspell-Tests'
			with: [ spec requires: #( 'Symspell-Pharo' 'Symspell' ) ].
		spec group: 'default' with: #( 'Symspell-Pharo' 'Hashtable' ) ]
]
