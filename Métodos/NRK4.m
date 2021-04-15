function y = NRK4(f,a,b,n,y0)
%NRK4 Método de Runge-Kutta de ordem 4 para resolução numérica de EDO/PVI
%   y'=f(t,y), t=[a,b], y(a)=y0
%   y(i+1) = y(i)+(k1+2*k2+2*k3+k4)/6;
%INPUT:
%   f - função da EDO y'=f(t,y)
%   [a,b] - intervalo de valores da variável independente t
%   n - núnmero de subintervalos ou iterações do método
%   y0 - aproximação inicial y(a)=y0
%OUTPUT:
%   y - vetor das soluções aproximadas do PVI em cada um dos t(i)
%
%   26/03/2021  Arménio Correia  armenioc@isec.pt
%   06/04/2021  nome aluno

h = (b-a)/n;
t = a:h:b;
y = zeros(1,n+1);
y(1) = y0;
for i = 1:n
    k1 = h*f(t(i),y(i));
    k2 = h*f(t(i) + (h/2), y(i) + (1/2) * k1);
    k3 = h*f(t(i) + (h/2), y(i) + (1/2) * k2);
    k4 = h*f(t(i + 1), y(i) + k3);
    y(i+1) = y(i)+(k1+2*k2+2*k3+k4)/6;
end
end

