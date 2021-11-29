

Para implementar esta solución utilizamos la metodología TDD sugerida por la cátedra.

Comenzamos relizando los tests e implementaciones de Depositos y Extracciones en ReceptiveAccount, testeando que se puedan realizar transacciones simples y que no se puedan realizar transacciones negativas o con cero. Luego nos aseguramos de que las transacciones se registren en las cuentas correctamente.

Continuamos con las transferencias entre cuentas. Realizamos test para revisar que las transferencias afecten el saldo de las cuentas y no se puedan realizar transacciones inválidas. Finalmente, refactorizando, creamos la clase 'TransferTransaction' y modelamos dos patas: 'Transfer Deposit' y 'TransferWithdraw'. Las cuales son subclases de AccountTransaction, ya que son transacciones de una única cuenta.

Procedimos con la creación de portfolios. Primero comenzamos realizando test que impliquen portfolios que solo incluyan cuentas, ya que nos pareció mas simple. Luego, añadimos los test e implementaciones para portfolios que contienen otros portfolios.

Interpretamos la consigna de manera incorrecta y por eso tenemos test y mensajes que no deberían estar: test 11 y 10 y los respectivos mensajes que utilizan.
