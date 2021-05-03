function y = NRK2(f,a,b,n,y0)

%RK2 - Método de Runge-Kutta de ordem 2 para resolução numérica de EDO/PVI
%   y'=f(t,y), t=[a,b], y(a)=y0
%   y(i+1)=y(i)+ 1/2*(k1+k2)

%INPUT:
%   f - função da EDO y'=f(t,y)
%   [a,b] - intervalo de valores da variável independente t
%   n - número de subintervalos ou iterações do método
%   y0 - aproximação inicial y(a)=y0

%OUTPUT:
%   y - vetor das soluções aproximadas do PVI em cada um dos t(i)

%   15/04/2021  Tomás Silva  a2020143845@isec.pt
%   15/04/2021  Tomás Pinto  a2020144067@isec.pt
%   15/04/2021  Francisco Mendes  a2020143982@isec.pt

h = (b-a)/n; %Amplitude de cada subintervalo

t = a:h:b; %Criar vetor que vai de "a" a "b" com step de "h"
y = zeros(1,n+1); %Alocamento de memória

y(1) = y0; %Definir o primeiro elemento do vetor

for i =1:n %Aplicar o Método de RK2 (iteração)
    k1 = h*f(t(i),y(i));
    k2 = h*f(t(i+1),y(i)+k1);
    y(i+1) = y(i)+(k1+k2)/2;
end

end

