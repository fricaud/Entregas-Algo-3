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


!classDefinition: #NullContainer category: 'Stack-Exercise'!
Object subclass: #NullContainer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 01:06:41'!
addContainerWith: anObject to: aStack

	aStack addLast: (RealContainer new with: anObject and: self).! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 01:32:40'!
content
	^self error: OOStack stackEmptyErrorDescription.! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 00:28:40'!
isEmpty
	^true! !

!NullContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 00:48:41'!
removeLastContainerFrom: aStack
	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 01:29:46'!
initialize
	stack := OrderedCollection new.
	stack addLast: (NullContainer new).	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 01:31:41'!
isEmpty
	^(stack at: stack size) isEmpty! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 01:30:32'!
pop
	^(stack at: stack size) removeLastContainerFrom: stack.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 01:31:08'!
push: anObject
	^(stack at: stack size) addContainerWith: anObject to: stack.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 01:50:37'!
size
	^(stack size) - 1! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 01:30:48'!
top
	^(stack at: stack size) content! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: 'stack'!

!OOStack class methodsFor: 'error descriptions' stamp: 'FR 11/1/2021 14:27:09'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #RealContainer category: 'Stack-Exercise'!
Object subclass: #RealContainer
	instanceVariableNames: 'previousContainer content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!RealContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 01:07:51'!
addContainerWith: anObject to: aStack
	aStack addLast: (RealContainer new with: anObject and: self).! !

!RealContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 01:33:06'!
content
	^content.! !

!RealContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 00:29:58'!
isEmpty
	^false! !

!RealContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 01:08:26'!
removeLastContainerFrom: aStack
	aStack removeLast.
	^content.! !

!RealContainer methodsFor: 'as yet unclassified' stamp: 'FR 11/2/2021 00:34:51'!
with: anObject and: aContainer
	previousContainer := aContainer.
	content := anObject! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
