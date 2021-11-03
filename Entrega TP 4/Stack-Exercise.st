!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:35:14'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:39:45'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:40:25'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:41:02'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:41:54'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:42:06'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:43:34'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:44:15'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:48:01'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'FR 11/1/2021 14:48:54'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'Stack prefix sentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
!SentenceFinderByPrefixTest commentStamp: 'FR 11/2/2021 20:47:36' prior: 0!
setUp

nuevoStack := OOStack new.

nuevoStack push: 'Esta va a ser la primer frase'.

nuevoStack push: 'esta va a ser la segunda frase'.

nuevoStack push: 'estas frases son mas'.

nuevoStack push: 'Esta tiene que aparecer'.

nuevoStack push: 'Estas tiene que aparecer a pesar de la S extra'.

nuevoStack push: 'Estalalalala tiene que aparecer a pesar de lalalalalalalala'.

prefix := 'esta'.!


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'FR 11/3/2021 03:53:59'!
setUp

Stack := OOStack new.

Stack push: 'Esta va a ser la primer frase'.

Stack push: 'esta va a ser la segunda frase'.

Stack push: 'estas frases son mas'.

Stack push: 'Esta tiene que aparecer'.

Stack push: 'Estas tiene que aparecer a pesar de la S extra'.

Stack push: 'Estalalalala tiene que aparecer a pesar de lalalalalalalala'.

sentenceFinder := SentenceFinderByPrefix new.

prefix := 'Esta'.! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FR 11/3/2021 03:53:59'!
test01SeEncuentraUnaOraciónConElPrefijo
	
	self assert: (	sentenceFinder find: prefix in: Stack) size > 0.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FR 11/3/2021 03:53:59'!
test02SeEncuentraLaCantidadDeOracionesConElPrefijo
	
	self assert: (	sentenceFinder find: prefix in: Stack) size equals: 4.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FR 11/3/2021 03:53:59'!
test03SeDevuelvenTodasLasFrasesCorrespondientes
	
	| resultadoCorrecto |
	
	resultadoCorrecto := OrderedCollection new.
	
	resultadoCorrecto add: 'Esta va a ser la primer frase'. 
	resultadoCorrecto add: 'Esta tiene que aparecer'.
	resultadoCorrecto add: 'Estas tiene que aparecer a pesar de la S extra'.
	resultadoCorrecto add: 'Estalalalala tiene que aparecer a pesar de lalalalalalalala'.	
	
	self assert: (	sentenceFinder find: prefix in: Stack) equals: resultadoCorrecto! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'FR 11/3/2021 03:53:59'!
test04ElStackQuedaIgualDespuesDeBuscar
	
	| stackOriginal |
	
	stackOriginal := Stack.
	
	sentenceFinder find: prefix in: Stack.
	
	self assert: Stack equals: stackOriginal.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 20:21:32'!
changeTopTo: anObject

	top := anObject! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 20:24:55'!
initialize

	top := NullContainer new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 21:27:00'!
isEmpty

	^top isEmpty! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:54:44'!
pop

	^top removeLastContainerFrom: self.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:54:49'!
push: anObject

	top addContainerWith: anObject to: self! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 20:24:47'!
size

	^top sizeCounter: 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:54:59'!
top

	^top content! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: 'stack'!

!OOStack class methodsFor: 'error descriptions' stamp: 'FR 11/1/2021 14:27:09'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'FR 11/3/2021 03:39:46'!
find: aPrefix in: aStack
	
	|result|
	result := OrderedCollection new.
	
	1 to: (aStack size) do: [:x | result addFirst: aStack pop].
	1 to: (result size) do: [:position | aStack push: (result at: position)].	
	
	^result select: [:aString | aString beginsWith: aPrefix].! !


!classDefinition: #StackContainer category: 'Stack-Exercise'!
Object subclass: #StackContainer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 21:40:51'!
addContainerWith: anObject to: aStack

	^self subclassResponsibility.! !

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:50:53'!
content

	^self subclassResponsibility.! !

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 20:15:17'!
initializeWith: anObject and: aContainer

	^self subclassResponsibility ! !

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:50:50'!
isEmpty

	^self subclassResponsibility! !

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:50:47'!
removeLastContainerFrom: aStack

	^self subclassResponsibility ! !


!classDefinition: #FilledContainer category: 'Stack-Exercise'!
StackContainer subclass: #FilledContainer
	instanceVariableNames: 'previousContainer content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 21:41:14'!
addContainerWith: anObject to: aStack

	aStack changeTopTo: (FilledContainer new initializeWith: anObject and: self).! !

!FilledContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 21:33:28'!
content

	^content! !

!FilledContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 21:39:59'!
initializeWith: anObject and: aContainer

	previousContainer := aContainer.
	content := anObject! !

!FilledContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 21:33:39'!
isEmpty

	^false! !

!FilledContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 21:36:37'!
removeLastContainerFrom: aStack

	aStack changeTopTo: previousContainer.
	
	^content.! !

!FilledContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 21:35:15'!
sizeCounter: stackSize
	
	^previousContainer sizeCounter: stackSize + 1.! !


!classDefinition: #NullContainer category: 'Stack-Exercise'!
StackContainer subclass: #NullContainer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 21:41:52'!
addContainerWith: anObject to: aStack

	aStack changeTopTo: (FilledContainer new initializeWith: anObject and: self).! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:56:09'!
content

	^self error: OOStack stackEmptyErrorDescription ! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:56:12'!
isEmpty

	^true! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:56:14'!
removeLastContainerFrom: aStack

	^self error: OOStack stackEmptyErrorDescription.! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 20:18:48'!
sizeCounter: stackSize
	
	^stackSize! !
