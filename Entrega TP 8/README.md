Para resolver el ejercicio servicios financieros 2 comenzamos tomando la solución con extra de la cátedra para evitar arrastrar errores de nuestro modelo.

Comenzamos aplicando TDD creando así los primeros reportes (AccountSummary y TransferNet) los cuales nos llevaron a un modelo con Ifs. 

Al momento de refactorizar, primero realizamos mensajes polimórficos que nos permitían realizar las tareas, pero no cumplíamos con la segunda parte del enunciado, ya que cada vez que agregábamos un nuevo tipo de reporte, teníamos que modificar los mensajes que recibían el resto de los objetos.

Esto lo solucionamos creando mensajes simples (accept: y visitXXX:) que nos permitían con el mismo mensaje, volver a los reportes correspondientes para realizar las operaciones necesarias para crearlos.

Tomamos la decisión de que los reportes se creen inmediatamente, devolviendo los mismos el string que contiene los resultados mostrados como se ejemplificaba en la consigna. Nuestro razonamiento detrás de esto fue pensar en los objetos cómo métodos, por lo que nos pareció más apropiado que inmediatamente realicen su acción en vez de crear un objeto al cuál le teníamos que pedir su resultado.

Por último, para el extra agregamos a los objetos cuenta (Portfolios y ReceptiveAccounts) mensajes para de creación de las cuentas para poder agregarles nombres y otro para obtener estos mismos para los reportes. Además, agregamos accept: y visitXXX: para poder usar el mismo criterio para crear futuros reportes que afecten a estos objetos.

Creamos mensajes en nuestros nuevos reportes (PortfolioTreePrinter y PortfolioDetailedTreePrinter) para que en los mismos además de imprimirse los datos que les pedíamos a las cuentas, se agregaran las indentaciones necesarias para dejar en evidencia la estructura de los portfolios que usamos de ejemplo.
