% facts

decision("inmediata")
decision("15 min")
decision("30-60 min")
decision("60-120 min")
decision("120-240 min")

% Seccion 1
alerta(Grado,Puntuacion):-
alerta("1",0).
alerta("2",5).
alerta("3",10).
alerta("4",15).

apnea(Grado,Puntuacion):-
apnea("1",0).
apnea("2",5).
apnea("3",10).
apnea("4",15).

ausencia_pulso(Grado,Puntuacion):-
ausencia_pulso("1",0).
ausencia_pulso("2",5).
ausencia_pulso("3",10).
ausencia_pulso("4",15).

intubacion(Grado,Puntuacion):-
intubacion("1",0).
intubacion("2",5).
intubacion("3",10).
intubacion("4",15).

angor(Grado,Puntuacion):-
angor("1",0).
angor("2",5).
angor("3",10).
angor("4",15).

% Seccion 2
traumatismo(Grado,Puntuacion):-
traumatismo("1",0).
traumatismo("2",5).
traumatismo("3",10).
traumatismo("4",15).

heridas(Grado,Puntuacion):-
heridas("1",0).
heridas("2",5).
heridas("3",10).
heridas("4",15).

trabajo_respiratorio(Grado,Puntuacion):-
trabajo_respiratorio("1",0).
trabajo_respiratorio("2",5).
trabajo_respiratorio("3",10).
trabajo_respiratorio("4",15).

 
cianosis(Grado,Puntuacion):
cianosis("1",0).
cianosis("2",5).
cianosis("3",10).
cianosis("4",15).


palidez(Grado,Puntuacion):-
palidez("1",0).
palidez("2",5).
palidez("3",10).
palidez("4",15).


hemorragia(Grado,Puntuacion):-
hemorragia("1",0).
hemorragia("2",5).
hemorragia("3",10).
hemorragia("4",15).


dolor(Grado,Puntuacion):-
dolor("1",0).
dolor("2",5).
dolor("3",10).
dolor("4",15).


intoxicacion(Grado,Puntuacion):-
intoxicacion("1",0).
intoxicacion("2",10).
intoxicacion("3",15).


convulsiones(Grado,Puntuacion):-
convulsiones("1",0).
convulsiones("2",10).
convulsiones("3",15).

 
giasgow_neurologico(Grado,Puntuacion):-
giasgow_neurologico("1",0).
giasgow_neurologico("2",5).
giasgow_neurologico("3",10).
giasgow_neurologico("4",15).


deshidratacion(Grado,Puntuacion):-
deshidratacion("1",0).
deshidratacion("2",5).
deshidratacion("3",10).
deshidratacion("4",15).


psicosis_agitacion_violencia(Grado,Puntuacion):-
psicosis_agitacion_violencia("1",0).
psicosis_agitacion_violencia("2",0).
psicosis_agitacion_violencia("3",15).
psicosis_agitacion_violencia("4",15).



% Seccion 3
Frecuencia_Cariaca(Grado,Puntuacion):-
Frecuencia_Cariaca("1",10).
Frecuencia_Cariaca("2",5).
Frecuencia_Cariaca("3",0).
Frecuencia_Cariaca("4",5).
Frecuencia_Cariaca("5",10).

temperatura(Grado,Puntuacion):-
temperatura("1",10).
temperatura("2",5).
temperatura("3",0).
temperatura("4",5).
temperatura("5",10).

frecuencia_respiratoria(Grado,Puntuacion):-
frecuencia_respiratoria("1",10).
frecuencia_respiratoria("2",5).
frecuencia_respiratoria("3",0).
frecuencia_respiratoria("4",5).
frecuencia_respiratoria("5",10).

tension_arterial(Grado,Puntuacion):-
tension_arterial("1",10).
tension_arterial("2",5).
tension_arterial("3",0).
tension_arterial("4",5).
tension_arterial("5",10).


glucemia(Grado,Puntuacion):-
glucemia("1",10).
glucemia("2",5).
glucemia("3",0).
glucemia("4",5).
glucemia("5",10).

concatenar_lista(X, L, L2):-
    L2 = [X|L].

total([], 0).
total([X|Y], Sum) :-
    total(Y, Rest),
    Sum is X + Rest.

decision_final(Total, "inmediata") :- Total >= 0, Total =< 5.
decision_final(Total, "15 min") :- Total >= 6, Total =< 10.
decision_final(Total, "30-60 min") :- Total >= 11, Total =< 20.
decision_final(Total, "60-120 min") :- Total >= 21, Total =< 30.
decision_final(Total, "120-240 min") :- Total > 30.

triage():-
    write("Ingrese el grado de traumatismo"),
    read(X),
    traumatismo(X,Puntaje),
    concatenar_lista(Puntaje,[],Lista).
    write("Ingrese el grado de heridas"),
    read(X),
    heridas(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de aumento de trabajo respiratorio"),
    read(X),
    trabajo_respiratorio(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de cianosis"),
    read(X),
    cianosis(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de palidez"),
    read(X),
    palidez(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de hemorragia"),
    read(X),
    hemorragia(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de dolor visible"),
    read(X),
    dolor(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de intoxicación o auto daño"),
    read(X),
    intoxicacion(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de convulsiones"),
    read(X),
    convulsiones(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de Giasgow neurologico"),
    read(X),
    giasgow_neurologico(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de deshidratación"),
    read(X),
    deshidratacion(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de psicosis, agitación o violencia"),
    read(X),
    psicosis_agitacion_violencia(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de frecuencia cardiaca"),
    read(X),
    frecuencia_cardiaca(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de temperatura"),
    read(X),
    temperatura(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de frecuencia respiratoria"),
    read(X),
    frecuencia_respiratoria(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de tensión arterial"),
    read(X),
    tension_arterial(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    write("Ingrese el grado de glucemia"),
    read(X),
    glucemia(X,Puntaje),
    concatenar_lista(Puntaje,Lista,Lista).
    