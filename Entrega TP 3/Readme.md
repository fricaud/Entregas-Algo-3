Para este trabajo práctico de Números PT 2 seguimos el algoritmo para eliminar Ifs reemplazándolos por polimorfismo.
La resolución que elegimos fue crear 2 mensajes por cada operación que ya existía, uno para realizar la operación con Enteros y otro con Fracciones. De esta forma, las dos clases tienen mensajes para realizar las operaciones específicas entre ellas y la responsabilidad de verificar las clases de números para las operaciones queda en el mensaje y no en el emisor o el receptor, ya que cada instancia sabe como responder al mensaje. De lo contrario, enviará un mensaje de error.
Para poder enviar estos mensajes que creamos, reemplazamos los métodos que existían con un método que enviaba el mensaje que correspondía (sea el de operar con entero o fracción) alternando el orden del emisor y receptor del mensaje original.

Extra de Fibonacci, verificaciones de fracción:
Hacemos una segunda entrega en otra carpeta ya que para intentar resolver esto cambiamos la manera en la que se inicializan los Enteros y puede no estar correcto.
Creamos nuevas abstracciones como subclases de enteros las cuales nos permitían crear mensajes para realizar las verificaciones que hacían los Ifs de Fibonacci y la creación de Fracciones a partir de 2 enteros con el operador “ / ”.
