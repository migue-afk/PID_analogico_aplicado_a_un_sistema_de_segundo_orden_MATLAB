# PID_analógico_aplicado_a_un_sistema_de_segundo_orden_MATLAB
Controlador PID analogico aplicado_MATLAB
### Funcionamiento del código
Para entender el código de mejor manera, iremos mencionando el número de la linea de código y se dara su explicación en caso de ser necesario.
### Diseño de la planta
Las condiciones para el diseño de la planta son las siguientes un maximo sobre impulso Mp del 65% y un tiempo de establecimiento de 2 segundos, como se hace uso de un OPAM en
configuración Sallen Key es necesario imponerce un valor, sea este capacitivo o resistivo, para este caso se a impuesto el valor capacitivo c1 de 0.001 faradios, a partir de ahí las lineas de código 17 a la 27 cálculan los valores necesarios de R, Ra, Rb y c2 adémas de la frecuencia natural wn, observar la figura para obtener mayor detalle.

![](https://github.com/migue-afk/PID_analogico_aplicado_a_un_sistema_de_segundo_orden_MATLAB/blob/master/Imagenes_y_referencias/Sistema%20de%20segundo%20orden%20OPAM.PNG)

### PID analógico

Para el PID analógico se hara uso de la siguientre estructura 

![](https://github.com/migue-afk/PID_analogico_aplicado_a_un_sistema_de_segundo_orden_MATLAB/blob/master/Imagenes_y_referencias/PID%20analogico.PNG)

La función de transferencia que domina el modelo analógico es la siguiente

![](https://latex.codecogs.com/svg.latex?G_%7Bc%7D%28s%29%3D%5Cfrac%7BK_%7Bp%7DT_%7Bd%7DT_%7Bi%7Ds%5E2&plus;K_%7Bp%7DT_%7Bi%7Ds&plus;K_%7Bp%7D%7D%7BT_%7Bi%7Ds%7D)

El codigo que hace referencia a la función de transferencia en MATLAB se detalla desde la linea 48 a la 93, sin embargo los valores resistivos y capacitivos del PID analógico
se detalla desde la linea 72 hasta la 93.

### Resultado final
La salida del sistema aplicando el PID analógico es la siguiente.

![](https://github.com/migue-afk/PID_analogico_aplicado_a_un_sistema_de_segundo_orden_MATLAB/blob/master/Imagenes_y_referencias/Salida%20del%20sistema%20aplicando%20controlador%20ANALOGICO.PNG)


Nota: La imagen PID analógico.PNG y la imagen Sistema de segundo orden OPAM.PNG son parte a las webs mencionadas en el documento Refencias.txt
