function y = MEuler(f,a,b,n,y0)

%Euler - Método de Euler para resolução numérica de EDO/PVI
%   y'=f(t,y), t=[a,b], y(a)=y0
%   y(i+1)=y(i)+hf(t(i),y(i)), i=0,1,2,...,n

%INPUT:
%   f - função da EDO y'=f(t,y)
%   [a,b] - intervalo de valores da variável independente t
%   n - núnmero de subintervalos ou iterações do método
%   y0 - aproximação inicial y(a)=y0

%OUTPUT:
%   y - vetor das soluções aproximadas do PVI em cada um dos t(i)

%   26/03/2021  Arménio Correia  armenioc@isec.pt
%   15/04/2021  Tomás Silva  a2020143845@isec.pt
%   15/04/2021  Tomás Pinto  a2020144067@isec.pt
%   15/04/2021  Francisco Mendes  a2020143982@isec.pt

h = (b-a)/n; %Amplitude de cada subintervalo
t = zeros(1, n+1); %Alocação de Memória
y = zeros(1, n+1); %Alocação de Memória
t(1) = a; %Definir o primeiro elemento do array
y(1) = y0; %Definir o primeiro elemento do array
for i =1:n %Aplicar o Método de Euler (iteração)
    y(i+1) = y(i)+h*f(t(i),y(i));
    t(i+1) = t(i)+h;
end
end

