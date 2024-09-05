Class {
	#name : 'BaselineOfSymspellPharo',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSymspell-Pharo',
	#package : 'BaselineOfSymspell-Pharo'
}

{ #category : 'baselines' }
BaselineOfSymspellPharo >> baselineOf: spec [

	spec for: #pharo do: [
  spec 
    baseline: 'ContainersHashTable' 
    with: [ spec repository: 'github://pharo-containers/Containers-HashTable/src' ].
		spec package: 'Symspell' with: [ spec requires: #( 'Hashtable' ) ].
		spec
			package: 'Symspell-Tests'
			with: [ spec requires: #(  'Symspell' 'Hashtable' ) ].
		spec group: 'default' with: #( 'Symspell' 'Hashtable' ) ]
]
