function [yh yp y] = solveODEL2(p,b)
%SOLVEODEL2  Resolver Equa��es Diferenciais Lineares de Ordem 2 Completa
%   Aplicando o M�todo da Varia��o das Constantes Arbitr�rias
%   a2*y''+a1*y'+a0*y = b(x)  
%
%INPUT:
%   p - Vector com os Coeficientes da Equa��o Caracter�stica p=[a2 a1 a0]
%   b - Vector coluna com os termos independentes do Sistema de Lagrange 
%       b=[0; b(x)/a2] 
%    
%OUTPUT: 
%   yh - Solu��o geral da Equa��o Homog�nea Correspondente a2*y''+a1*y'+a0*y = 0 
%   yp - Uma solu��o particular da ED Completa 
%   y - Solu��o Geral da Equa��o Diferencial y = yh + yp
%
%CHAMADA da fun��o na linha de comandos
%   syms x  declarar x como vari�vel simb�lica
%   [yh yp y] = solveODEL2([a2 a1 a0],[0; b(x)])
%
%   Autor: Arm�nio Correia .: armenioc@isec.pt 
%   Data: 17/02/2020

syms x C1 C2 % declara��o de vari�veis locais e simb�licas

% Caso n�o sejam introduzidos os par�metros de entrada p e b
% Considerar por exemplo a ED y''-2y'+y = exp(x)

% if (~nargin) 
%     p = [1 -2 1]; 
%     b = [0; exp(x)];
% end;

if(length(p) ~= 3)
    error('n�o � de segunda ordem')
else
    % 1.� PASSO
    % Resolu��o da Equa��o Homog�nea Correspondente
    yh = dsolve([num2str(p(1)) '*D2y +(' num2str(p(2)) ')*Dy +('  ...
             num2str(p(3)) ')*y=0'],'x');
    
    % Determina��o das ra�zes da equa��o caracter�stica a2*x^2+a1*x+a0=0
    s = solve(poly2sym(p));
   
    % Estabelecer o Sistema Fundamental de Solu��es S.F.S
    if(p(2)^2-4*p(1)*p(3)) == 0
        for i=1:2
            s(i) = x^(i-1)*exp(s(i)*x); % Raiz real de multiplicidade=2
        end
    elseif (p(2)^2-4*p(1)*p(3)) > 0
        s  = exp(s*x); % Raizes reais simples
    else
        % Raizes complexas
        s =[exp(real(s(1))*x)*sin(abs(imag(s(1)))*x) ...
            exp(real(s(2))*x)*cos(abs(imag(s(2)))*x)].';
    end

    % 2.� PASSO
    % Determina��o de uma Solu��o Particular da Equa��o Completa

    % Matriz Wronskiana 
    % coincidente com a matriz dos coeficientes do Sistema de Lagrange   
    A=[s.'; simplify(diff(s,x)).'];
    % Wronskiano = determinante da matriz A
    %W = det(A)
   
    % Resolu��o do Sistema de Lagrange = Sistema de Cramer
    % em ordem �s derivadas das constantes arbitr�rias 
    C_linha = inv(A)*b;
    % Determina��o das constantes arbitr�rias por integra��o
    C  = int(C_linha,x);
   
    % Estabelecer uma solu��o particular yp da equa��o completa em que 
    % C1=C1(x) e C2=C2(x), isto �, s�o fun��es de x = Constantes Arbitr�rias
    yp = sym(0);
    for i=1:length(s)
        yp = yp + eval(['C' num2str(i)])*s(i);
    end
    
    % Substituir em yp C1 e C2 pelos valores obtidos em C  
    for i=1:length(C)
        yp = subs(yp,eval(['C' num2str(i)]),C(i));
    end
    
    % 3.� PASSO
    % Solu��o ou Integral Geral da Equa��o Diferencial
    y = yh + yp;
end