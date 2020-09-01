%Dise�o de un sistema de segundo orden bajo caracteristicas especificas
clear all;
clc;
%Parametros dados para la generaci�n de la planta a controlar

Mp=65;      %Maximo sobreimpulso 
k=1.01;     %Ganancia de la planta_Este valor dependera del circuito usado, 
            %en este caso haremos uso de un circuito con AMPLIFICADOR 
            %OPERACIONAL, en su configuraci�n filtro pasa bajo Sallen_Key.
            
ts=2;       %Tiempo de establecimiento de la planta
c1=0.001;   %Para los calculos de las resistencias ademas del capacitor C2
            %es necesario imponerse un valor en este caso, se impondra el
            %valor capacitivo c1, el cual corresponde a 1000uf.

%C�lculo de los parametros
phi=sqrt((1)/(((pi^2)/(log(Mp/100))^2)+1))      %Factor de amortiguamiento
m=(phi/2 )*((1+(sqrt(1+((2*(k-1))/(phi^2))))))  %Relaci�n entre el Factor 
                                                %de amortiguamiento y el
                                                %factor de ganancia de la
                                                %planta K.

wn=(4)/(phi*ts)                                 %Frecuencia natural
R=(1)/(wn*m*c1)                                 %Resistencias
Ra=(2*k*R)/(k-1)
Rb=2*k*R
c2=(m^2)*c1                                     %Capacitor C2

%Planta de segundo orden Funcion de transferencia

                