function y = NPM(f,a,b,n,y0)

%PM  Método Númerico para resolver um PVI: Ponto Médio
%   y = NPM(f,a,b,n,y0) Método numérico para a resolução de um PVI

%INPUT:
%   f - função da EDO y'=f(t,y)
%   [a,b] - intervalo de valores da variável independente t
%   n - núnmero de subintervalos ou iterações do método
%   y0 - aproximação inicial y(a)=y0

%OUTPUT:
%   y - vetor das soluções aproximadas do PVI em cada um dos t(i)

%   26/03/2021  Arménio Correia  armenioc@isec.pt
%   18/04/2021  Tomás Silva  a2020143845@isec.pt
%   18/04/2021  Tomás Pinto  a2020144067@isec.pt
%   18/04/2021  Francisco Mendes  a2020143982@isec.pt

h = (b-a)/n; %Amplitude de cada subintervalo

t = a:h:b; %Criar vetor que vai de "a" a "b" com step de "h"
y = zeros(1, n+1); %Alocamento de memória

y(1) = y0; %Definir o primeiro elemento do vetor

for i=1:n %Aplicar o Método do Ponto Médio (iteração)
    k1 = 0.5 * f(t(i), y(i));
    y(i+1) = y(i) + h*f(t(i) + h/2, y(i) + h*k1);
    y(i+1) = y(i) + h*f(t(i) + h/2, 0.5*(y(i) + y(i+1)));
end

end