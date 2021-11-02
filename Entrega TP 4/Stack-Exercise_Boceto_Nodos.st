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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 00:21:49'!
changeTopTo: anObject
	top := anObject! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:55:10'!
increaseSize

	size := size + 1! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:55:16'!
initialize

	top := NullContainer new.
	size := 0! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 00:14:17'!
isEmpty
	^top isEmpty! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:54:44'!
pop

	^top removeLastContainerFrom: self.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:54:49'!
push: anObject

	top addContainerWith: anObject to: self! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:55:26'!
reduceSize

	size := size - 1! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:55:02'!
size

	^size! !

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


!classDefinition: #StackContainer category: 'Stack-Exercise'!
Object subclass: #StackContainer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:55:56'!
addContainerWith: anObject to: aStack

	^self subclassResponsibility.! !

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:50:53'!
content

	^self subclassResponsibility.! !

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:50:50'!
isEmpty

	^self subclassResponsibility! !

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:50:47'!
removeLastContainerFrom: aStack

	^self subclassResponsibility ! !

!StackContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:56:01'!
with: anObject and: aContainer

	^self subclassResponsibility ! !


!classDefinition: #NullContainer category: 'Stack-Exercise'!
StackContainer subclass: #NullContainer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:53:46'!
addContainerWith: anObject to: aStack

	aStack changeTopTo: (RealContainer new with: anObject and: self).
	aStack increaseSize.! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:56:09'!
content

	^self error: OOStack stackEmptyErrorDescription ! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:56:12'!
isEmpty

	^true! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:56:14'!
removeLastContainerFrom: aStack

	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #RealContainer category: 'Stack-Exercise'!
StackContainer subclass: #RealContainer
	instanceVariableNames: 'previousContainer content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!RealContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:54:06'!
addContainerWith: anObject to: aStack

	aStack changeTopTo: (RealContainer new with: anObject and: self).
	aStack increaseSize.! !

!RealContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:56:19'!
content

	^content! !

!RealContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:56:22'!
isEmpty

	^false! !

!RealContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:56:24'!
removeLastContainerFrom: aStack

	aStack changeTopTo: previousContainer.
	aStack reduceSize.
	^content.! !

!RealContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 13:56:27'!
with: anObject and: aContainer

	previousContainer := aContainer.
	content := anObject! !
