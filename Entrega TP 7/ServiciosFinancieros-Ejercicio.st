!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JML 11/23/2021 20:49:08'!
test05ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JML 11/23/2021 20:49:12'!
test06ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JML 11/23/2021 20:49:17'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JML 11/23/2021 20:54:26'!
test08TransactionValueMustBeGreaterThanZero

	| account transactionValue |
	
	account := ReceptiveAccount new.
	transactionValue := -50 * peso.
	
	
	self 
		should: [Withdraw register: transactionValue on: account ] 
		raise: Error 
		withExceptionDo: [:anError|
			self assert: account balance equals: (0*peso).
			self assert: anError messageText equals: AccountTransaction valorDeTransaccionInvalido .
		].
	
	self 
		should: [Deposit register: transactionValue on: account ] 
		raise: Error 
		withExceptionDo: [:anError|
			self assert: account balance equals: (0*peso).
			self assert: anError messageText equals: AccountTransaction valorDeTransaccionInvalido.
		].
	
	
! !


!classDefinition: #TestTransfer category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TestTransfer
	instanceVariableNames: 'originAccount destinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'JML 11/23/2021 21:13:25'!
test01UnaTrasferenciaDescuentaDelBalanceDeLaCuentaDeOrigenYAgregaAlBalanceDeLaCuentaDeDestino
	
	Transfer from: originAccount to: destinationAccount for: 100*peso.
	
	self assert: originAccount balance equals: (-100*peso).
	self assert: destinationAccount balance equals: (100*peso). ! !

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'JML 11/23/2021 21:13:22'!
test02NoSePuedeRealizarUnaTransferenciaConValorCero

	
	self 
		should: [Transfer from: originAccount to: destinationAccount for: 0*peso.] 
		raise: Error 
		withExceptionDo: [:anError|
			self assert: originAccount balance equals: (0*peso).
			self assert: destinationAccount balance equals: (0*peso).
			self assert: anError messageText equals: AccountTransaction valorDeTransaccionInvalido.
		].
	 
	! !

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'JML 11/23/2021 21:13:16'!
test03NoSePuedeRealizarUnaTransferenciaConValorNegativo
	
	self 
		should: [Transfer from: originAccount to: destinationAccount for: -100*peso] 
		raise: Error 
		withExceptionDo: [:anError|
			self assert: originAccount balance equals: (0*peso).
			self assert: destinationAccount balance equals: (0*peso).
			self assert: anError messageText equals: AccountTransaction valorDeTransaccionInvalido.
		].
	
	! !

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'JML 11/23/2021 22:31:36'!
test04
	
	Transfer from: originAccount to: destinationAccount for: 100*peso.
	
	self assert: ((originAccount transactions at: 1) isKindOf: TransferWithdraw).
	self assert: ((destinationAccount transactions at: 1) isKindOf: TransferDeposit).
	! !

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'JML 11/23/2021 22:36:30'!
test05
	
	Transfer from: originAccount to: destinationAccount for: 100*peso.
	
	self assert: (((originAccount transactions at: 1) transferPartner)value) equals: 100*peso.
	self assert: (((originAccount transactions at: 1) transferPartner) isKindOf: TransferDeposit).
	! !


!TestTransfer methodsFor: 'setUp/tearDown' stamp: 'JML 11/23/2021 21:13:29'!
setUp

	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'JML 11/23/2021 21:51:13'!
value 

	^value! !


!AccountTransaction methodsFor: 'initialization' stamp: 'JML 11/23/2021 21:41:49'!
initializeFor: aValue

	value := aValue! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'JML 11/23/2021 20:52:29'!
register: aValue on: account

	| transaction |
	
	aValue > 0 ifFalse: [self error: self valorDeTransaccionInvalido].
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'JML 11/23/2021 20:51:35'!
valorDeTransaccionInvalido

	^'El valor de la transaccion debe ser mayor a 0.'! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialize' stamp: 'JML 11/23/2021 21:58:32'!
addTransferPartner: aPartner
	
	^self subclassResponsibility 

	! !

!Transfer methodsFor: 'initialize' stamp: 'JML 11/23/2021 22:01:12'!
transferPartner
	^self subclassResponsibility 

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'initialize' stamp: 'JML 11/23/2021 22:30:53'!
from: originAccount to: destinationAccount for: amountToTransfer

	|deposit withdraw|

	deposit := TransferDeposit register: amountToTransfer on: destinationAccount.
	withdraw := TransferWithdraw register:  amountToTransfer on: originAccount.
	
	
	deposit addTransferPartner: withdraw.
	withdraw addTransferPartner: deposit.
	
	! !

!Transfer class methodsFor: 'initialize' stamp: 'JML 11/23/2021 20:10:07'!
valorDeTransferenciaInvalido

	^'El valor de transferencia tiene que ser mayor a 0.'! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #TransferDeposit
	instanceVariableNames: 'partnerTransferWithdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'initialize' stamp: 'JML 11/23/2021 21:59:13'!
addTransferPartner: aWithdrawPartner
	
	partnerTransferWithdraw := aWithdrawPartner 

	! !

!TransferDeposit methodsFor: 'initialize' stamp: 'JML 11/23/2021 22:01:25'!
transferPartner

	^partnerTransferWithdraw 

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'JML 11/23/2021 22:03:26'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
Transfer subclass: #TransferWithdraw
	instanceVariableNames: 'partnerTransferDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'initialize' stamp: 'JML 11/23/2021 21:59:42'!
addTransferPartner: aDepositPartner
	
	partnerTransferDeposit := aDepositPartner 

	! !

!TransferWithdraw methodsFor: 'initialize' stamp: 'JML 11/23/2021 22:01:34'!
transferPartner

	^partnerTransferDeposit 

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'JML 11/23/2021 22:03:32'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !



!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JML 11/23/2021 22:24:24'!
balance

	^transactions sum: [ :aTransaction |
		
		 (aTransaction isKindOf: Deposit) ifTrue: [ aTransaction value ] ifFalse: [
			(aTransaction isKindOf: Withdraw) ifTrue: [ aTransaction value negated] ifFalse: [
				(aTransaction isKindOf: TransferDeposit) ifTrue: [ aTransaction value ] ifFalse: [
					(aTransaction isKindOf: TransferWithdraw) ifTrue: [ aTransaction value negated]. 
					]
				]
			]
		] ifEmpty: [ 0 ] ! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !
