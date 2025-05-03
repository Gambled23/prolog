% filepath: /home/gambled/Codes/prolog/Practica8.pl
conyuge_es_rico(X) :- casado(X,Y), ingresos(Y,Ing), Ing>2000, !.
conyuge_es_rico(X) :- casado(X,Y), ingresos(Y,Ing), Ing>=1500, extranjero(Y), !.

% Hechos para Maria
casado(maria, juan).       % Maria está casada con Juan
ingresos(juan, 2500).      % Juan tiene ingresos mayores a 2000
casado(maria, carlos).     % Maria también está casada con Carlos
ingresos(carlos, 1800).    % Carlos tiene ingresos mayores o iguales a 1500
extranjero(carlos).        % Carlos es extranjero

% Hechos para Elena
casado(elena, pedro).      % Elena está casada con Pedro
ingresos(pedro, 1600).     % Pedro tiene ingresos mayores o iguales a 1500
extranjero(pedro).         % Pedro es extranjero