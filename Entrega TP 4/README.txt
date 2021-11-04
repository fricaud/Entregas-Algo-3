
Para este trabajo nuevamente presentamos dos modelos: Uno que resuelve �nicamente la parte principal del tp y el segundo una propuesta para la resoluci�n de la parte extra. 

Para la primer parte comenzamos con un modelado simple que nos permita pasar los test.  
Creamos los mensajes que vimos en los tests: pop, push, top, isEmpty. Luego, agregamos el mensaje initialize para poder crear una OrderedCollection que usamos para nuestro stack.
Este modelo conten�a ifs y la mayor�a de las interacciones solo afectaban al tope de esta colecci�n. 

Luego de tener completa esta soluci�n y escuchar posibles soluciones en la clase, procedimos a
deliberar como ibamos a modelar el stack de manera definitiva. En la catedra se habian propuesto
dos soluciones: Modelar el tope del stack, similar a una torre de hanoi o modelar a partir de estados del stack. A ambos nos parecio mas intuitiva la primera solucion, por lo que decidimos ir con esa opcion.

Creamos una Abstracci�n de contenedores de 'comportamiento nulo' o de'comportamiento real'. Estos �ltimos contienen una referencia al contenedor anterior. De esta manera, creabamos el stack con una variable top con un contenedor nulo que nos permite saber en que momento el stack est� vac�o ya que este contenedor tiene comportamiento nulo. El stack se comunica con el tope, el cual dependiendo el tipo de contenedor sea nos devuelve la interacci�n deseada para un stack lleno o vac�o. 

Luego avanzamos con el buscador de prefijo para el cual creamos el mensaje find:in: el cual itera el stack y lo guarda en una OrderedCollection y luego itera la OrderedCollection para rearmar el stack. Por �ltimo, utilizamos el mensaje select de la OrderedCollection para filtrar los strings con el mensaje BeginsWith:. Para las verificaciones del prefijo optamos por dejar los ifs en el m�todo find:in: ya que los consideramos ifs accidentales y no merec�an crear una abstracci�n de prefijo para resolverlos con polimorfismo. Para asegurar que todo funcione, creamos siete pruebas que verifican el correcto funcionamiento del buscador de prefijo. Para esto primero comenzamos con pruebas simples que nos permitian verificar el comportamiento esperado y luego avanzamos con los casos borde. 

Para la parte extra, creamos dos nuevas abstracciones como subclases del stack, 'limitedSizeStack' y 'unlimitedSizeStack'. Si se crea un stack simplemente con el mensaje 'new' se crear� un stack sin l�mite de tama�o, y creamos el mensaje 'with:' para que el stack se cree con un tama�o m�ximo, el cual queda guardado en una variable de instancia. Las �nicas diferencias entre el comportamiento de ambos es que el limited responde al mensaje maxSize que devuelve el tama�o m�ximo que puede tener el stack y que esta subclase tambi�n realiza una verificaci�n antes de hacer un 'push' comparando el tama�o actual con el m�ximo. Una vez m�s, optamos por dejar este chequeo en este mensaje, ya que lo consideramos un if accidental.

Para verificar el correcto funcionamiento de esta nueva abstracci�n, duplicamos todos los tests originales y los que hab�amos agregado nosotros, agregando dos tests adicionales para la nueva funcionalidad del limitedSizeStack.




