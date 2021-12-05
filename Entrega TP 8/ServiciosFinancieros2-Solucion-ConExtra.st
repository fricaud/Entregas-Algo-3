!classDefinition: #EspecialReportsTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #EspecialReportsTest
	instanceVariableNames: 'myAccount childrenPortfolio johnsAccount angiesAccount familyPortfolio saltoDeLinea account account2 portfolio1'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!EspecialReportsTest methodsFor: 'setUp' stamp: 'FR 12/5/2021 20:20:03'!
setUp
	
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	account:= ReceptiveAccount named: 'unaCuenta'.
	account2:= ReceptiveAccount named: 'otraCuenta'.
	portfolio1:= Portfolio named: 'otroPortfolio' with: account.
	
	saltoDeLinea := (String with: Character cr).
	! !


!EspecialReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 21:46:52'!
test01UnaReceptiveAccountSePuedeCrearConNombre

	self assert: (myAccount accountName) equals: 'Cuenta mia'! !

!EspecialReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 21:46:14'!
test02UnPortfolioSePuedeCrearConUnNombre

	self assert: (childrenPortfolio accountName) equals: 'Portfolio de hijos'! !

!EspecialReportsTest methodsFor: 'testing' stamp: 'FR 12/5/2021 20:14:25'!
test03UnPortfolioTreePrinterSeCreaCorrectamenteConUnPortfolioVacio
	
	| portfolioVacio |
	
	portfolioVacio := Portfolio named: 'Portfolio Vacio'.
	
	self assert: (PortfolioTreePrinter createReportFor: portfolioVacio) equals: portfolioVacio accountName, saltoDeLinea! !

!EspecialReportsTest methodsFor: 'testing' stamp: 'FR 12/5/2021 20:14:57'!
test04UnPortfolioTreePrinterSeCreaCorrectamenteConUnPortfolioConUnaCuenta
	
	| portfolioConUnaCuenta |
	
	portfolioConUnaCuenta := Portfolio named: 'Portfolio con una cuenta' with: angiesAccount.
	
	self assert: (PortfolioTreePrinter createReportFor: portfolioConUnaCuenta) equals: 
	portfolioConUnaCuenta accountName , saltoDeLinea,
	'	',angiesAccount accountName,saltoDeLinea.! !

!EspecialReportsTest methodsFor: 'testing' stamp: 'FR 12/5/2021 20:15:24'!
test05UnPortfolioTreePrinterSeCreaCorrectamenteConUnPortfolioConVariasCuentas
	
	self assert: (PortfolioTreePrinter createReportFor: childrenPortfolio) equals: 
	childrenPortfolio accountName, saltoDeLinea,
	'	',johnsAccount accountName, saltoDeLinea,
	'	',angiesAccount accountName, saltoDeLinea.! !

!EspecialReportsTest methodsFor: 'testing' stamp: 'FR 12/5/2021 20:15:39'!
test06UnPortfolioTreePrinterSeCreaCorrectamenteConUnPortfolioConUnaCuentaYOtrosPortfolios

	self assert: (PortfolioTreePrinter createReportFor: familyPortfolio) equals:
	familyPortfolio accountName, saltoDeLinea,
	'	', myAccount accountName , saltoDeLinea, 
	'	', childrenPortfolio accountName , saltoDeLinea, 
	'	','	',johnsAccount accountName, saltoDeLinea,
	'	','	',angiesAccount accountName, saltoDeLinea.! !

!EspecialReportsTest methodsFor: 'testing' stamp: 'FR 12/5/2021 20:20:20'!
test07UnPortfolioTreePrinterSeCreaCorrectamenteConUnPortfolioConVariasCuentasYPortfoliosConOtrosPortfolios
	
	childrenPortfolio add: portfolio1.
	familyPortfolio add: account2.
	
	self assert: (PortfolioTreePrinter createReportFor: familyPortfolio) equals: 
	familyPortfolio accountName, saltoDeLinea,
	'	', myAccount accountName , saltoDeLinea, 
	'	', childrenPortfolio accountName , saltoDeLinea, 
	'	','	',johnsAccount accountName, saltoDeLinea,
	'	','	',angiesAccount accountName, saltoDeLinea,
	'	','	',portfolio1 accountName, saltoDeLinea,
	'	','	','	',account accountName, saltoDeLinea,
	'	', account2 accountName , saltoDeLinea.! !

!EspecialReportsTest methodsFor: 'testing' stamp: 'FR 12/5/2021 20:17:13'!
test08UnPortfolioDetailedTreePrinterSeCreaCorrectamenteConUnPortfolioConUnaCuenta
	
	| portfolioConUnaCuenta |
	
	portfolioConUnaCuenta := Portfolio named: 'Portfolio con una cuenta' with: angiesAccount.
	
	Deposit register: 100*peso on: angiesAccount.
	
	self assert: (PortfolioTreePrinter createReportFor: portfolioConUnaCuenta) equals: 
	portfolioConUnaCuenta accountName , saltoDeLinea,
	'	',angiesAccount accountName,saltoDeLinea.! !

!EspecialReportsTest methodsFor: 'testing' stamp: 'FR 12/5/2021 20:20:28'!
test09UnPortfolioDetailedTreePrinterSeCreaCorrectamenteConUnPortfolioConVariasCuentasYPortfoliosConOtrosPortfolios
	
	childrenPortfolio add: portfolio1.
	familyPortfolio add: account2.
	
	Deposit register: 200*peso on: angiesAccount.
	Deposit register: 100*peso on: johnsAccount.
	Deposit register: 300*peso on: myAccount.
	Deposit register: 100*peso on: account.
	Withdraw register:1000*peso on: account2.
	Withdraw register: 150*peso on: myAccount.
	Withdraw register: 50*peso on: johnsAccount.
	Withdraw register: 300*peso on: angiesAccount.

	self assert: (PortfolioDetailedTreePrinter createReportFor: familyPortfolio) equals:'Portfolio de la familia',saltoDeLinea,
	'	Cuenta mia',saltoDeLinea,
	'		Depósito por 300 pesos',saltoDeLinea,
	'		Extracción por 150 pesos',saltoDeLinea,
	'		Balance = 150 pesos',saltoDeLinea,
	'	Portfolio de hijos',saltoDeLinea,
	'		Cuenta de Juan',saltoDeLinea,
	'			Depósito por 100 pesos',saltoDeLinea,
	'			Extracción por 50 pesos',saltoDeLinea,
	'			Balance = 50 pesos',saltoDeLinea,
	'		Cuenta de Angeles',saltoDeLinea,
	'			Depósito por 200 pesos',saltoDeLinea,
	'			Extracción por 300 pesos',saltoDeLinea,
	'			Balance = -100 pesos',saltoDeLinea,
	'		otroPortfolio',saltoDeLinea,
	'			unaCuenta',saltoDeLinea,
	'				Depósito por 100 pesos',saltoDeLinea,
	'				Balance = 100 pesos',saltoDeLinea,
	'	otraCuenta',saltoDeLinea,
	'				Extracción por 1000 pesos',saltoDeLinea,
	'				Balance = -1000 pesos',saltoDeLinea,
	'	Balance = -800 pesos'.! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'FR 12/2/2021 20:45:55'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit CreateReportFor: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'FR 12/2/2021 20:45:55'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit CreateReportFor: 100 * peso.
	withdraw := Withdraw CreateReportFor: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #ReportsTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportsTest
	instanceVariableNames: 'account1 summary1 account2 saltoDeLinea portfolio1 account3 portfolio2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportsTest methodsFor: 'setUp' stamp: 'FR 12/4/2021 20:46:11'!
createSummaryForAccount1
	
	^AccountSummary createReportFor: account1! !

!ReportsTest methodsFor: 'setUp' stamp: 'FR 12/4/2021 20:46:23'!
createSummaryForAccount2
	
	^AccountSummary createReportFor: account2! !

!ReportsTest methodsFor: 'setUp' stamp: 'FR 12/4/2021 20:55:04'!
createThreeTransfersBetweenAccount1And2

	Transfer amount: 100*peso from: account1  to: account2.
	Transfer amount: 100*peso from: account2  to: account1. 
	Transfer amount: 100*peso from: account1  to: account2.! !

!ReportsTest methodsFor: 'setUp' stamp: 'FR 12/4/2021 20:48:29'!
createTransferNetForAccount1
	
	^TransferNet createReportFor: account1! !

!ReportsTest methodsFor: 'setUp' stamp: 'FR 12/4/2021 20:48:35'!
createTransferNetForAccount2
	
	^TransferNet createReportFor: account2! !

!ReportsTest methodsFor: 'setUp' stamp: 'FR 12/4/2021 22:19:40'!
setUp
		
	account1 := ReceptiveAccount new.
	
	account2 := ReceptiveAccount new.
	
	account3 := ReceptiveAccount new.
	
	saltoDeLinea := (String with: Character cr).
	
	portfolio1 := Portfolio with: account1 with: account2.
	
	portfolio2 := Portfolio new.
	
	portfolio2 add: portfolio1.
	portfolio2 add: account3.! !


!ReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 22:19:40'!
test01UnSumarioDeUnaCuentaSinTransaccionesDevuelveBalanceCero
	
	self assert: self createSummaryForAccount1 equals: 'Balance = 0 pesos'.
	self assert: (AccountSummary createReportFor: portfolio2) equals: 'Balance = 0 pesos'.! !

!ReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 20:57:55'!
test02UnSumarioMuestraCorrectamenteElResultadoParaUnaCuentaConUnDepósito
	
	Deposit register: 100*peso on: account1.
	
	self assert: self createSummaryForAccount1 equals: 'Depósito por 100 pesos', saltoDeLinea ,'Balance = 100 pesos'! !

!ReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 20:58:06'!
test03UnSumarioMuestraCorrectamenteElResultadoParaUnaCuentaConUnaExtracción
		
	Withdraw register: 100*peso on: account1.
	
	self assert: self createSummaryForAccount1 equals: 'Extracción por 100 pesos', saltoDeLinea ,'Balance = -100 pesos'! !

!ReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 20:58:18'!
test04LosSumariosMuestranCorrectamenteElResultadoParaUnaDosCuentasLuegoDeUnaTransferencia
				
	Transfer amount: 100*peso from: account1  to: account2.
	
	self assert: self createSummaryForAccount1 equals: 'Salida por transferencia de 100 pesos', saltoDeLinea ,'Balance = -100 pesos'.
	self assert: self createSummaryForAccount2 equals: 'Entrada por transferencia de 100 pesos', saltoDeLinea ,'Balance = 100 pesos'! !

!ReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 21:51:55'!
test05LosSumariosMuestranElResultadoCorrectoParaUnaCuentaConVariasTransacciones
		
	Transfer amount: 100*peso from:account1  to: account2.
	Deposit register: 100*peso on: account1.
	Withdraw register: 200*peso on: account1.
	Deposit register: 100*peso on: account2. 
	
	self assert: self createSummaryForAccount1 equals:
	 'Salida por transferencia de 100 pesos', saltoDeLinea ,'Depósito por 100 pesos', saltoDeLinea ,'Extracción por 200 pesos', saltoDeLinea ,'Balance = -200 pesos'.
	
	self assert: self createSummaryForAccount2 equals: 
	'Entrada por transferencia de 100 pesos', saltoDeLinea, 'Depósito por 100 pesos', saltoDeLinea ,'Balance = 200 pesos'! !

!ReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 22:13:39'!
test06ElsumarioSeCreaCorrectamenteParaUnPortfolio
	
	Transfer amount: 100*peso from:account1  to: account2.
	Deposit register: 100*peso on: account1.
	Withdraw register: 200*peso on: account1.
	Deposit register: 100*peso on: account2. 

	self assert: (AccountSummary createReportFor: portfolio1) equals:
	'Salida por transferencia de 100 pesos', saltoDeLinea ,
	'Depósito por 100 pesos', saltoDeLinea ,
	'Extracción por 200 pesos', saltoDeLinea , 
	'Entrada por transferencia de 100 pesos', saltoDeLinea, 
	'Depósito por 100 pesos', saltoDeLinea ,
	'Balance = 0 pesos'.! !

!ReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 22:19:40'!
test07ElsumarioSeCreaCorrectamenteParaUnPortfolioConOtroPortfolio

	Transfer amount: 100*peso from:account1  to: account2.
	Deposit register: 100*peso on: account1.
	Withdraw register: 200*peso on: account1.
	Deposit register: 100*peso on: account2.
	Deposit register: 100*peso on: account3.

	self assert: (AccountSummary createReportFor: portfolio2) equals:
	'Salida por transferencia de 100 pesos', saltoDeLinea ,
	'Depósito por 100 pesos', saltoDeLinea ,
	'Extracción por 200 pesos', saltoDeLinea , 
	'Entrada por transferencia de 100 pesos', saltoDeLinea, 
	'Depósito por 100 pesos', saltoDeLinea ,
	'Depósito por 100 pesos', saltoDeLinea ,
	'Balance = 100 pesos'.! !

!ReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 22:20:31'!
test08UnTransferNetDeUnaCuentaSinTransaccionesDaResultadoCero
	
	self assert: self createTransferNetForAccount1 equals: 'Neto de transferencias = 0 pesos'.
	self assert: (TransferNet createReportFor: portfolio2) equals: 'Neto de transferencias = 0 pesos'.! !

!ReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 22:01:14'!
test09LosTransferNetDeDosCuentasConUnaTransaccionSonCorrectos
	
	Transfer amount: 100*peso from: account1  to: account2.

	self assert: self createTransferNetForAccount1 equals: 'Neto de transferencias = -100 pesos'.
	self assert: self createTransferNetForAccount2 equals: 'Neto de transferencias = 100 pesos'.! !

!ReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 22:01:21'!
test10LosTransferNetDeDosCuentasConVariasTransaccionesSonCorrectos

	self createThreeTransfersBetweenAccount1And2.
	
	self assert: self createTransferNetForAccount1 equals: 'Neto de transferencias = -100 pesos'.
	self assert: self createTransferNetForAccount2 equals: 'Neto de transferencias = 100 pesos'.! !

!ReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 22:01:28'!
test11LosTransferNetDeDosCuentasConTodosLosTiposDeTransaccionesSonCorrectos
	
	self createThreeTransfersBetweenAccount1And2.
	Deposit register: 100*peso on: account1.
	Withdraw register: 100*peso on: account2.

	self assert: self createTransferNetForAccount1 equals: 'Neto de transferencias = -100 pesos'.
	self assert: self createTransferNetForAccount2 equals: 'Neto de transferencias = 100 pesos'.! !

!ReportsTest methodsFor: 'testing' stamp: 'FR 12/4/2021 22:19:41'!
test12LosTransferNetDeUnPortfolioConOtroPortfolioAdentroSonCorrectos
	
	self createThreeTransfersBetweenAccount1And2.	
	Deposit register: 100*peso on: account1.
	Withdraw register: 100*peso on: account3.
	
	self assert: (TransferNet createReportFor: portfolio2) equals: 'Neto de transferencias = 0 pesos'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReportsTest class' category: 'ServiciosFinancieros-Solucion'!
ReportsTest class
	instanceVariableNames: ''!

!ReportsTest class methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 23:32:58'!
createReportFor: anAccount withIndent: anIndent
	
	^self new
		initializeFor: anAccount;
		createReport! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: 'accountName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'FR 12/4/2021 21:39:36'!
accountName

	^accountName! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'initialization' stamp: 'FR 12/4/2021 21:39:36'!
nameAccount: aName
	
	accountName:= aName! !


!Account methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 23:29:03'!
accept: aVisitor
	
	^self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'FR 12/4/2021 23:48:38'!
accept: aPortfolioVisitor
	
	^aPortfolioVisitor visitPortfolio: self.
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'FR 12/4/2021 22:31:55'!
accounts

	^accounts! !

!Portfolio methodsFor: 'main protocol' stamp: 'FR 12/1/2021 20:44:47'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [0*peso]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'FR 12/4/2021 21:21:42'!
addedTo: aPortfolio 
	
	parents add: aPortfolio! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 22:51:12'!
named: aName

	^self new 
		nameAccount: aName;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 21:22:38'!
named: aName with: anAccount

	^self new 
		nameAccount: aName;
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 21:28:24'!
named: aName with: anAccount with: anotherAccount

	^self new 
		nameAccount: aName;
		add: anAccount;
		add: anotherAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'FR 12/1/2021 20:46:32'!
balance

	^transactions 
		inject: 0*peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 23:48:46'!
accept: aReceptiveAccountVisitor

	^aReceptiveAccountVisitor visitReceptiveAccount: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 21:26:20'!
named: aName
	
	^self new nameAccount: aName.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 19:48:03'!
accept: anAccountSummary

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'FR 12/2/2021 21:30:28'!
affectBalanceForNetTransfer: anAccountTransferNet

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'FR 12/2/2021 20:51:52'!
affectBalance: aBalance

	^aBalance + value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 19:49:40'!
accept: aTransactionVisitor

	aTransactionVisitor visitDeposit: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'FR 12/2/2021 20:45:55'!
CreateReportFor: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'FR 12/2/2021 20:45:55'!
register: aValue on: account

	| transaction |
	
	transaction := self CreateReportFor: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !


!TransferLeg methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 19:48:03'!
accept: anAccountSummary

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 19:53:13'!
accept: anAccountSummary

	anAccountSummary visitTransferDeposit: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 19:53:22'!
accept: anAccountSummary

	anAccountSummary visitTransferWithdraw: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 19:52:14'!
accept: anAccountSummary

	anAccountSummary visitWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'FR 12/2/2021 20:45:55'!
CreateReportFor: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'FR 12/2/2021 20:45:55'!
register: aValue on: account

	| transaction |
	
	transaction := self CreateReportFor: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Reports category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Reports
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Reports methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 23:09:14'!
createReport

	self subclassResponsibility.
	! !

!Reports methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 19:51:04'!
visitDeposit: aDeposit
	^self subclassResponsibility ! !

!Reports methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 19:54:00'!
visitTransferDeposit: aTransferWithdraw
	^self subclassResponsibility ! !

!Reports methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 19:53:55'!
visitTransferWithdraw: aTransferWithdraw
	^self subclassResponsibility ! !

!Reports methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 19:53:44'!
visitWithdraw: aWithdraw
	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Reports class' category: 'ServiciosFinancieros-Solucion'!
Reports class
	instanceVariableNames: ''!

!Reports class methodsFor: 'creating' stamp: 'FR 12/4/2021 23:09:15'!
createReportFor: anAccount
	
	^self new
		initializeFor: anAccount;
		createReport! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Reports subclass: #AccountSummary
	instanceVariableNames: 'finalReport account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 16:54:46'!
createReport

	account transactions do: 
	[:transaction | 	transaction accept: self].
	
	^finalReport append: 'Balance = ', account balance asString.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 20:31:54'!
initializeFor: anAccount
	
	account := anAccount.
	finalReport := ''.! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 20:14:38'!
visitDeposit: aDeposit
	
	finalReport := finalReport, 'Depósito por ', aDeposit value asString, (String with: Character cr)! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 20:14:46'!
visitTransferDeposit: aTransferDeposit

	finalReport := finalReport , 'Entrada por transferencia de ', aTransferDeposit value asString, (String with: Character cr)! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 20:14:52'!
visitTransferWithdraw: aTransferWithdraw

	finalReport := finalReport , 'Salida por transferencia de ', aTransferWithdraw value asString, (String with: Character cr)! !

!AccountSummary methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 20:14:56'!
visitWithdraw: aWithdraw
	
	finalReport := finalReport ,'Extracción por ', aWithdraw value asString, (String with: Character cr)! !


!classDefinition: #PortfolioPrinter category: 'ServiciosFinancieros-Solucion'!
Reports subclass: #PortfolioPrinter
	instanceVariableNames: 'portfolio indentationCounter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioPrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 20:28:18'!
createReport

	^self subclassResponsibility! !

!PortfolioPrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 20:29:10'!
createReportWithIndentFor: aPortfolio

	| newPortfolioTree indentation |
	
	newPortfolioTree :=''.
	indentation := self getNewIndentation.
	
	newPortfolioTree := newPortfolioTree,aPortfolio accountName, (String with: Character cr).
 	aPortfolio accounts do: [:account | newPortfolioTree := newPortfolioTree, indentation, (account accept: self)].
	^newPortfolioTree! !

!PortfolioPrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 20:27:43'!
getNewIndentation
	
	| indentation |
	
	indentation:=''.
	indentationCounter := indentationCounter + 1.
	
	1 to: indentationCounter do: [:unused | indentation := indentation, '	'].
	
	^indentation! !

!PortfolioPrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 20:27:19'!
initializeFor: aPortfolio
	
	self subclassResponsibility ! !

!PortfolioPrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 20:27:04'!
visitPortfolio: aPorfolio

	^self subclassResponsibility ! !

!PortfolioPrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 20:26:48'!
visitReceptiveAccount: aReceptiveAccount

	^self subclassResponsibility! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
PortfolioPrinter subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: 'portfolioDetailedTree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 17:05:57'!
createIndentedSummaryFor: aReceptiveAccount

	| indentation indentedSummary |
	
	indentedSummary := ''.
	
	indentation:= self getNewIndentation.
	
	(AccountSummary createReportFor: aReceptiveAccount) linesDo: [:line | indentedSummary := indentedSummary, indentation, line, (String with: Character cr)].
	
	self decreaseIndentation.
	
	^indentedSummary! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 20:25:11'!
createReport
	
	| indent |
	indent := self getNewIndentation.
	
	portfolioDetailedTree := portfolioDetailedTree, portfolio accountName, (String with: Character cr).
 	portfolio accounts do: [:account | portfolioDetailedTree := portfolioDetailedTree, indent, (account accept: self)].
	^portfolioDetailedTree,'	','Balance = ', portfolio balance asString.! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 17:05:16'!
decreaseIndentation

	indentationCounter:= indentationCounter - 1.! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 20:25:12'!
initializeFor: aPortfolio
	
	indentationCounter:= 0.
	portfolio := aPortfolio.
	portfolioDetailedTree := ''.! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 16:08:34'!
visitPortfolio: aPorfolio

	^self createReportWithIndentFor: aPorfolio.! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 17:03:56'!
visitReceptiveAccount: aReceptiveAccount

	^(aReceptiveAccount accountName, (String with: Character cr)), (self createIndentedSummaryFor: aReceptiveAccount).! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
PortfolioPrinter subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolioTree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 20:30:44'!
createReport
	
	| indent |
	
	portfolioTree := portfolioTree, portfolio accountName, (String with: Character cr).
	
	indent:= self getNewIndentation.
	
 	portfolio accounts do: [:account | portfolioTree := portfolioTree, indent, (account accept: self)].
	
	^portfolioTree! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 17:00:38'!
initializeFor: aPortfolio
	
	indentationCounter:= 0.
	portfolio := aPortfolio.
	portfolioTree := ''.! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/5/2021 16:47:06'!
visitPortfolio: aPorfolio

	^self createReportWithIndentFor: aPorfolio.! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 23:46:23'!
visitReceptiveAccount: aReceptiveAccount

	^(aReceptiveAccount accountName, (String with: Character cr))! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
Reports subclass: #TransferNet
	instanceVariableNames: 'transferNetBalance account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 23:09:14'!
createReport

	account transactions do: 
	[:transaction | transaction accept: self	].
	
	transferNetBalance := 'Neto de transferencias = ', transferNetBalance asString.
	
	^transferNetBalance.! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 20:35:49'!
initializeFor: anAccount
	
	account := anAccount.
	transferNetBalance := 0*peso.! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 22:10:19'!
visitDeposit: aDeposit.

	transferNetBalance := transferNetBalance.	! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 19:56:14'!
visitTransferDeposit: aTransferDeposit.

	transferNetBalance := transferNetBalance + aTransferDeposit value.! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 19:55:47'!
visitTransferWithdraw: aTransferWithdraw.

	transferNetBalance := transferNetBalance - aTransferWithdraw value.! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'FR 12/4/2021 22:10:14'!
visitWithdraw: aWithdraw.

	transferNetBalance := transferNetBalance.	! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
