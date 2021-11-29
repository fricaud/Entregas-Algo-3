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


!classDefinition: #TestPortfolio category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TestPortfolio
	instanceVariableNames: 'portfolio account1 account2 account3 portfolio2 account4 account5'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'JML 11/27/2021 21:49:20'!
setUp

	portfolio := BankingPortfolio new.
	portfolio2 := BankingPortfolio new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new.

	account4 := ReceptiveAccount new. 
	account5 := ReceptiveAccount new.
	
	portfolio2 addElement: account4.
	portfolio2 addElement: account5.! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'JML 11/29/2021 16:57:08'!
test01UnPortfolioSeCreaConBalanceCero
	self assert: portfolio balance equals: 0. ! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'JML 11/29/2021 16:57:02'!
test02UnPortfolioNuevoNoContieneCuentasNiPortfolios
	self assert: portfolio accountsAndPortfoliosQuantity equals: 0. ! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'JML 11/29/2021 16:57:18'!
test03SeAgregaUnaCuentaCorrectamenteAlPortfolio
	portfolio addElement: account1.
	self assert: portfolio accountsAndPortfoliosQuantity equals: 1. ! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'JML 11/29/2021 16:57:26'!
test04SeAgreganMultiplesElementosCorrectamenteAlPortfolio
	portfolio addElement: account1.
	portfolio addElement: account2.
	portfolio addElement: portfolio2.
	self assert: portfolio accountsAndPortfoliosQuantity equals: 3. ! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'JML 11/29/2021 16:57:55'!
test05SeObtieneElBalanceCorrectoDeLasCuentasDelPortfolio
	portfolio addElement: account1.
	portfolio addElement: account2.
	portfolio addElement: account3.
	Deposit register: 100*peso on: account1.
	Deposit register: 300*peso on: account2.
	Withdraw register: 300*peso on: account3.
	self assert: portfolio balance equals: 100*peso. ! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'JML 11/29/2021 16:58:09'!
test06UnPortfolioPuedeVerificarSiUnaDeSusCuentasRegistroUnaTransaccion
	| deposit |
	
	portfolio addElement: account1.
	deposit := Deposit register: 300*peso on: account1. 
	self assert: (portfolio hasRegistered: deposit).! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'JML 11/29/2021 16:58:57'!
test07UnPortfolioConoceTodasLasTransaccionesDeCadaUnaDeSusCuentas
	portfolio addElement: account1.
	
	portfolio addElement: account2.
	
	portfolio addElement: account3.
	
	Deposit register: 300*peso on: account1. 
	
	Deposit register: 200*peso on: account1. 
	
	Withdraw register: 100*peso on: account1. 
	
	TransferTransaction from: account1 to: account2 for: 500*peso.
	
	Deposit register: 300*peso on: account2. 
	Withdraw register: 100*peso on: account3. 
	
	self assert: (portfolio anAccountTransactions: account1) equals: account1 transactions.
	self assert: (portfolio anAccountTransactions: account2) equals: account2 transactions.
	self assert: (portfolio anAccountTransactions: account3) equals: account3 transactions.
! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'JML 11/29/2021 17:00:28'!
test08UnPortfolioQueIncluyePortfoliosYCuentasCalculaSuBalanceCorrectamente
	portfolio addElement: portfolio2.
	
	portfolio addElement: account1.
	
	Deposit register: 1000*peso on: account4.
	
	Withdraw register: 200*peso on: account5.
	
	TransferTransaction from: account4 to: account5 for: 300*peso.
	
	TransferTransaction from: account5 to: account3 for: 300*peso.
	
	Deposit register: 100*peso on: account1.
	
	self assert: portfolio balance equals: 600*peso.! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'FR 11/29/2021 01:38:50'!
test09UnPortfolioQueIncluyeOtroPortfolioVerificaQueUnaDeSusCuentasRealizoUnaTransaccion

	| deposit |
	
	portfolio addElement: portfolio2.
	
	portfolio2 addElement: account1.
	
	deposit := Deposit register: 100*peso on: account1.
	
	self assert: (portfolio hasRegistered: deposit).! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'FR 11/29/2021 01:38:55'!
test10UnPortfolioQueIncluyeOtrosPortfolioPuedeEncontrarLasTransaccionesDeUnaDeSusCuentas
	| portfolio3 |
	portfolio3 := BankingPortfolio new.
	portfolio addElement: account1.
	portfolio addElement: portfolio2.
	portfolio2 addElement: portfolio3.
	portfolio3 addElement: account3.
	
	Deposit register: 200*peso on: account3.
	Deposit register: 1000*peso on: account4.
	Withdraw register: 200*peso on: account5.
	TransferTransaction from: account4 to: account5 for: 300*peso.
	TransferTransaction from: account5 to: account3 for: 300*peso.
	Deposit register: 100*peso on: account1.
	
	 
	self assert: (portfolio anAccountTransactions: account1) equals: account1 transactions.
	self assert: (portfolio anAccountTransactions: account4) equals: account4 transactions.
	self assert: (portfolio anAccountTransactions: account5) equals: account5 transactions.  
	self assert: (portfolio anAccountTransactions: account3) equals: account3 transactions.! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'FR 11/29/2021 01:39:05'!
test11UnPortfolioQueBuscaLasTrasaccionesDeUnaCuentaQueNoContieneDaErrorDeCuentaNoEncontrada
	| portfolio3 |
	portfolio3 := BankingPortfolio new.
	portfolio addElement: account1.
	portfolio addElement: portfolio2.
	portfolio2 addElement: portfolio3.
	portfolio3 addElement: account3.
	 
		
	self 
		should: [portfolio anAccountTransactions: account2.] 
		raise: Error 
		withExceptionDo: [:anError|.
			self assert: anError messageText equals: BankingPortfolio accountNotFoundError.
		].! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'JML 11/29/2021 17:01:23'!
test12UnPortfolioQueNoIncluyeOtrosPortfoliosObtieneTodasLasTransaccionesDeLasCuentasQueContiene

	| collection |
	
	portfolio addElement: account1.
	portfolio addElement: account2.
	
	Deposit register: 100*peso on: account1.
	Deposit register: 150*peso on:account2.
	
	collection := OrderedCollection new.
	
	collection addAll: account1 transactions.
	collection addAll: account2 transactions.
	
	self assert: (portfolio transactions) equals: collection.
	! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'JML 11/29/2021 17:01:35'!
test13UnPortfolioObtieneTodasLasTransaccionesDeLasCuentasYPortfoliosQueContiene

	| collection |
	portfolio addElement: account1.
	portfolio addElement: account2.
	
	portfolio addElement: portfolio2.
	
	Deposit register: 100*peso on: account1.
	Deposit register: 150*peso on:account2.
	Deposit register: 200*peso on:account4.
	Deposit register: 300*peso on:account5.
	
	collection := OrderedCollection new.
	
	collection addAll: account1 transactions.
	collection addAll:account2 transactions.
	collection addAll: account4 transactions.
	collection addAll: account5 transactions.
	
	self assert: (portfolio transactions) equals: collection.
	! !

!TestPortfolio methodsFor: 'as yet unclassified' stamp: 'JML 11/29/2021 16:05:59'!
testxx
	portfolio addElement: portfolio2.
	portfolio addElement: account1.
	
	self assert: (portfolio anAccountTransactions: account1) equals: account1 transactions.
	! !


!classDefinition: #TestTransfer category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TestTransfer
	instanceVariableNames: 'originAccount destinationAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'JML 11/28/2021 00:48:26'!
test01UnaTrasferenciaDescuentaDelBalanceDeLaCuentaDeOrigenYAgregaAlBalanceDeLaCuentaDeDestino
	
	TransferTransaction from: originAccount to: destinationAccount for: 100*peso.
	
	self assert: originAccount balance equals: (-100*peso).
	self assert: destinationAccount balance equals: (100*peso). ! !

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'JML 11/28/2021 00:48:26'!
test02NoSePuedeRealizarUnaTransferenciaConValorCero
	
	self 
		should: [TransferTransaction from: originAccount to: destinationAccount for: 0*peso.] 
		raise: Error 
		withExceptionDo: [:anError|
			self assert: originAccount balance equals: (0*peso).
			self assert: destinationAccount balance equals: (0*peso).
			self assert: anError messageText equals: AccountTransaction valorDeTransaccionInvalido.
		].
	 
	! !

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'JML 11/28/2021 00:48:26'!
test03NoSePuedeRealizarUnaTransferenciaConValorNegativo
	
	self 
		should: [TransferTransaction from: originAccount to: destinationAccount for: -100*peso] 
		raise: Error 
		withExceptionDo: [:anError|
			self assert: originAccount balance equals: (0*peso).
			self assert: destinationAccount balance equals: (0*peso).
			self assert: anError messageText equals: AccountTransaction valorDeTransaccionInvalido.
		].
	
	! !

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'JML 11/28/2021 00:48:26'!
test04AlHacerUnaTransferenciaSeRegistraUnaExtraccionEnLaCuentaDeOrigenYUnDepositoEnLaDeDestino
	
	| transfer |
	
	transfer := TransferTransaction from: originAccount to: destinationAccount for: 100*peso.
	
	self assert: (originAccount hasRegistered: transfer transferWithdraw).
	
	self assert: (destinationAccount hasRegistered: transfer transferDeposit).
	! !

!TestTransfer methodsFor: 'as yet unclassified' stamp: 'JML 11/28/2021 00:48:26'!
test05LaTransaccionDeUnaTransferenciaEnUnaCuentaConoceASuContraparte

	| transfer |
	
	transfer := TransferTransaction from: originAccount to: destinationAccount for: 100*peso.

	self assert: ( originAccount transactions last) transferCounterpart equals: transfer transferDeposit.
	
	self assert: (destinationAccount transactions last) transferCounterpart equals: transfer transferWithdraw.
	
	! !


!TestTransfer methodsFor: 'setUp/tearDown' stamp: 'JML 11/27/2021 19:18:55'!
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


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'JML 11/27/2021 19:51:53'!
affectBalance: aBalance
	
	^self subclassResponsibility ! !

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

!Deposit methodsFor: 'as yet unclassified' stamp: 'JML 11/27/2021 19:52:44'!
affectBalance: aBalance

	^ aBalance + value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'initialize' stamp: 'JML 11/25/2021 18:28:54'!
associateTransfer: aTransfer

	transfer := aTransfer! !

!TransferDeposit methodsFor: 'initialize' stamp: 'JML 11/27/2021 19:11:38'!
transferCounterpart

	^transfer transferWithdraw

	! !


!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'JML 11/27/2021 19:53:17'!
affectBalance: aBalance

	^ aBalance + value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'JML 11/23/2021 22:03:26'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'initialize' stamp: 'JML 11/27/2021 19:11:38'!
transferCounterpart

	^transfer transferDeposit.
	! !


!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'JML 11/27/2021 19:53:28'!
affectBalance: aBalance

	^ aBalance - value! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'JML 11/25/2021 18:29:08'!
associateTransfer: aTransfer

	transfer := aTransfer! !

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

!Withdraw methodsFor: 'as yet unclassified' stamp: 'JML 11/27/2021 19:53:35'!
affectBalance: aBalance

	^ aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #BankingPortfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #BankingPortfolio
	instanceVariableNames: 'accountsAndPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!BankingPortfolio methodsFor: 'all' stamp: 'JML 11/27/2021 21:51:47'!
accountsAndPortfoliosQuantity
	^ accountsAndPortfolios size.! !

!BankingPortfolio methodsFor: 'all' stamp: 'FR 11/29/2021 02:46:58'!
addElement: anAccountOrPortfolio 
	
	accountsAndPortfolios add: anAccountOrPortfolio! !

!BankingPortfolio methodsFor: 'all' stamp: 'JML 11/29/2021 16:06:48'!
anAccountTransactions: anAccount
	^(self findAccount: anAccount) = anAccount ifTrue:[ anAccount transactions] ifFalse: [^self error:BankingPortfolio accountNotFoundError]! !

!BankingPortfolio methodsFor: 'all' stamp: 'JML 11/29/2021 16:56:34'!
balance
	
	accountsAndPortfolios isEmpty ifTrue:[^0].
	
	^ accountsAndPortfolios sum: [:element| element balance]! !

!BankingPortfolio methodsFor: 'all' stamp: 'JML 11/29/2021 16:06:48'!
findAccount: anAccount
	|foundAccount|
	accountsAndPortfolios do: [: element | 
	foundAccount := (element findAccount: anAccount).
	foundAccount = anAccount 	ifTrue: [^foundAccount]].

	^self

! !

!BankingPortfolio methodsFor: 'all' stamp: 'JML 11/29/2021 16:11:28'!
hasRegistered: aTransaction
	
	^accountsAndPortfolios anySatisfy: [:anAccount| anAccount hasRegistered: aTransaction]
	! !

!BankingPortfolio methodsFor: 'all' stamp: 'JML 11/27/2021 21:51:47'!
initialize

	accountsAndPortfolios := OrderedCollection new.! !

!BankingPortfolio methodsFor: 'all' stamp: 'JML 11/29/2021 16:42:53'!
transactions

	| transactions |
	transactions := OrderedCollection new.
	
	accountsAndPortfolios do: [:element| transactions addAll:(element transactions)].
	
	^transactions! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BankingPortfolio class' category: 'ServiciosFinancieros-Ejercicio'!
BankingPortfolio class
	instanceVariableNames: ''!

!BankingPortfolio class methodsFor: 'as yet unclassified' stamp: 'FR 11/29/2021 01:06:33'!
accountNotFoundError
	^'La cuenta que busca no se encuentra en este portfolio'! !

!BankingPortfolio class methodsFor: 'as yet unclassified' stamp: 'FR 11/29/2021 01:29:57'!
errorDeCuentaOPortfolioRepetido

	^'La cuenta o portfolio que se esta intentado agregar ya se encuentra en el portfolio'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JML 11/27/2021 19:51:44'!
balance

	| balance |
	
	balance := 0.
	
	transactions do: [ :aTransaction | balance := aTransaction affectBalance: balance]. 
	
	 ^balance
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JML 11/29/2021 16:06:48'!
findAccount: anAccount

	^self! !

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


!classDefinition: #TransferTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferTransaction
	instanceVariableNames: 'transferWithdraw transferDeposit value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTransaction methodsFor: 'initialize' stamp: 'JML 11/23/2021 21:58:32'!
addTransferPartner: aPartner
	
	^self subclassResponsibility 

	! !

!TransferTransaction methodsFor: 'initialize' stamp: 'JML 11/27/2021 18:37:59'!
initializeWithOrigin: withdraw destination: deposit andValue: amountToTransfer

	value := amountToTransfer.
	transferWithdraw := withdraw.
	transferDeposit := deposit.
	
	transferWithdraw associateTransfer: self.
	transferDeposit associateTransfer: self.
	! !

!TransferTransaction methodsFor: 'initialize' stamp: 'JML 11/27/2021 19:11:39'!
transferCounterpart
	^self subclassResponsibility 

	! !


!TransferTransaction methodsFor: 'as yet unclassified' stamp: 'JML 11/27/2021 18:41:05'!
transferDeposit
	^transferDeposit ! !

!TransferTransaction methodsFor: 'as yet unclassified' stamp: 'JML 11/27/2021 18:41:22'!
transferWithdraw
	^transferWithdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction class
	instanceVariableNames: ''!

!TransferTransaction class methodsFor: 'initialize' stamp: 'JML 11/25/2021 18:25:41'!
from: originAccount to: destinationAccount for: amountToTransfer

	|deposit withdraw transfer|
	
	deposit := TransferDeposit register: amountToTransfer on: destinationAccount.
	withdraw := TransferWithdraw register: amountToTransfer on: originAccount.
	
	transfer := self new initializeWithOrigin: withdraw destination: deposit andValue: amountToTransfer.
	
	^transfer! !

!TransferTransaction class methodsFor: 'initialize' stamp: 'JML 11/23/2021 20:10:07'!
valorDeTransferenciaInvalido

	^'El valor de transferencia tiene que ser mayor a 0.'! !
