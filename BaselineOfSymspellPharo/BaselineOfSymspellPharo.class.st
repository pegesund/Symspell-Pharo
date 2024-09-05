Class {
	#name : 'BaselineOfSymspellPharo',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSymspellPharo',
	#package : 'BaselineOfSymspellPharo'
}

{ #category : 'baselines' }
BaselineOfSymspellPharo >> baseline: spec [

	<baseline>
	spec for: #pharo do: [
		spec 
    baseline: 'ContainersHashTable' 
    with: [ spec repository: 'github://pharo-containers/Containers-HashTable/src' ].
		spec package: 'Symspell' with: [ spec requires: #( 'ContainersHashTable' ) ].
		spec
			package: 'Symspell-Tests'
			with: [ spec requires: #( 'Symspell' ) ].
		spec group: 'default' with: #( 'Symspell' 'Symspell-Tests' 'ContainersHashTable' ) ]
]
