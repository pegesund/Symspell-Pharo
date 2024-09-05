Class {
	#name : 'BaselineOfSymspell',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSymspell',
	#package : 'BaselineOfSymspell'
}

{ #category : 'baselines' }
BaselineOfSymspell >> baselineOf: spec [	
	spec for: #common do: [
		spec
			baseline: 'Hashtable'
			with: [
			spec repository: 'github://pharo-containers/Hashtable:v1.x.x/src' ].
		spec package: 'Symspell' with: [ spec requires: #( 'Hashtable' ) ].
		spec
			package: 'Symspell-Tests'
			with: [ spec requires: #( 'Symspell' 'P3' ) ].
		spec
			group: 'default'
			with: #( 'Symspell' 'Symspell-test' 'Hashtable' ).
		spec group: 'core' with: #( 'Symspell' 'Hashtable' ) ] 
]
