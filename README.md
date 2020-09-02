# PID_analogico_aplicado_a_un_sistema_de_segundo_orden_MATLAB
Controlador PID analogico aplicado_MATLAB
### Funcionamiento del código
Para entender el código de mejor manera, iremos mencionando el número de la linea de código y se dara su explicación en caso de ser necesario.
### Diseño de la planta
Las condiciones para el diseño de la planta son las siguientes un maximo sobre impulso Mp del 65% y un tiempo de establecimiento de 2 segundos, como se hace uso de un OPAM en
configuración Sallen Key es necesario imponerce un valor, sea este capacitivo o resistivo, para este caso se a impuest el valor capacitivo c1 de 0.001 faradios, a partir de ahi las 
lineas de código 17 a la 27 cálculan los valores necesarios de R, Ra, Rb y c2 adémas de la frecuencia natural wn, observar la figura para obtener mayor detalle.
