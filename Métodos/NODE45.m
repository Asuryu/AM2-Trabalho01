function y = NODE45(f,a,b,n,y0)
%NODE45 para resolução numérica de EDO/PVI
%   y'=f(t,y), t=[a,b], y(a)=y0

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
    
    h = (b-a)/n;              
    t = a:h:b;               
    [~,y] = ode45(f,t,y0);
    y = y.';                    
end

