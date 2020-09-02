%Diseño de un sistema de segundo orden bajo caracteristicas específicas
clear all;
clc;
%Parametros dados para la generación de la planta a controlar

Mp=65;      %Máximo sobreimpulso 
k=1.01;     %Ganancia de la planta_Este valor dependera del circuito usado, 
            %en este caso haremos uso de un circuito con AMPLIFICADOR 
            %OPERACIONAL, en su configuración filtro pasa bajo Sallen_Key.
            
ts=2;       %Tiempo de establecimiento de la planta
c1=0.001;   %Para los cálculos de las resistencias ademas del capacitor C2
            %es necesario imponerse un valor en este caso, se impondra el
            %valor capacitivo c1, el cual corresponde a 1000uf.

%Cálculo de los parametros
phi=sqrt((1)/(((pi^2)/(log(Mp/100))^2)+1))      %Factor de amortiguamiento
m=(phi/2 )*((1+(sqrt(1+((2*(k-1))/(phi^2))))))  %Relación entre el Factor 
                                                %de amortiguamiento y el
                                                %factor de ganancia de la
                                                %planta K.

wn=(4)/(phi*ts)                                 %Frecuencia natural
R=(1)/(wn*m*c1)                                 %Resistencias
Ra=(2*k*R)/(k-1)
Rb=2*k*R
c2=(m^2)*c1                                     %Capacitor C2

%--------------------------------------------------------------------------
%Planta de segundo orden Función de transferencia
%Los parametros de a,b,c,d corresponde a la función de transferencia del
%circuito Sallen key.
a=(1+(Ra/Rb))*((1)/(c1*c2*(R^2)));
b=1;
c=(1/R)*((2/c1)-(Rb/(c2*Ra)));
d=(1)/(c1*c2*(R^2));

%Función de transferencia aplicada en MATLAB
num=[a];
den=[b c d];
sys=tf(num,den)/100;
step(sys,'r')
title("Función de transferencia")
%--------------------------------------------------------------------------
%%
%PID con valores de Kp Ti Td calculados con la forma directa de Ziegler
%aplicados a la forma matemática
Kp=0.6;
Ti=0.2135;
Td=0.0533;
a=Kp*Td*Ti;
b=Kp*Ti;
c=Kp;
d=Ti

%Función de transferencia aplicada en MATLAB
num=[a b c];
den=[0 d 0];
sys3=tf(num,den);
PID_app=sys*sys3;                   %Multiplicación de la planta con la 
                                    %función transferencia del PID
figure
sys4=(PID_app)/(PID_app+1)          %Feedback aplicado
step(sys4,'y')                      %Salida del sistema aplicando el PID de
                                    %forma matemática
title("Salida del sistema aplicando PID de forma matemática")

%--------------------------------------------------------------------------
%%
%Valores de cálculo del PID analógico
%Condiciones a priori R1 debe ser mayor a R3 talque R2 sea positivo
R1=10000;                             %Los valores resistivos y capacitivos 
                                      %seran en Ohms y Faradios
R3=1000;
C11=0.00001;
C22=0.00001;
R2=(R1*C11*Td)/((R1*C11*C22)-(C22*Td));
R4=(Kp*R3*R1*C22)/((R1*C11)+(R2*C22));

%Funcion de transferencia con OPAM
e=((R4*((R1*C11)+(R2*C22)))/(R1*R3*C22))*((R1*R2*C11*C22)/((R1*C11)+(R2*C22)))*((R1*C11)+(R2*C22));%s^2
f=((R4*((R1*C11)+(R2*C22)))/(R1*R3*C22))*((R1*C11)+(R2*C22));%s
g=((R4*((R1*C11)+(R2*C22)))/(R1*R3*C22));
h=((R1*C11)+(R2*C22))%s
num=[e f g];
den=[0 h 0];
sys11=tf(num,den);
PID_opam=sys*sys11;

figure
sys12=(PID_opam)/(PID_opam+1)                           %Feedback aplicado
step(sys12,'g')
title("Salida del sistema aplicando PID con OPAMS")

%Resumen Resultado final

figure
hold on
step(sys12,'g')
step(sys,'r')
title('Salida del sistema aplicando controlador ANALOGICO')
legend({'Sistema aplicando PID no discreto','Planta original'},'Location','southwest')
grid on
hold off

                