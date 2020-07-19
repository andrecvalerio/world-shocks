function r = numpar(rex)
% PURPOSE: determine the number of non-zero values of ARIMA model
% ------------------------------------------------------------
% SYNTAX: r = numpar(rex);
% ------------------------------------------------------------
% OUTPUT: r: 1x1 ---> number of elements different from f in
%         the AR and MA operators of ARIMA model
% ------------------------------------------------------------
% INPUT: rex: structure that contains the AR and MA operators
%        of ARIMA model, both regular and seasonal, as well as
%        the degrees of differencing
% ------------------------------------------------------------
% LIBRARY: conta

% written by:
%  Enrique M. Quilis
%  Macroeconomic Research Department
%  Ministry of Economy and Finance
%  Paseo de la Castellana, 162. Office 2.5-1.
%  28046 - Madrid (SPAIN)
%  <enrique.quilis@meh.es>

% Version 1.1 [August 2006]

r=0;

% regular AR operator

aux=rex.ar_reg;
r = r + conta(aux,0);
clear aux;

% regular MA operator

aux=rex.ma_reg;
r = r + conta(aux,0);
clear aux;

% seasonal AR operator

aux=rex.ar_sea;
r = r + conta(aux,0);
clear aux;

% seasonal MA operator

aux=rex.ma_sea;
r = r + conta(aux,0);
clear aux;

r=r-4;
