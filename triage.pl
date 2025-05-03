% filepath: /home/gambled/Codes/prolog/triage.pl

% Facts
decision("inmediata").
decision("15 min").
decision("30-60 min").
decision("60-120 min").
decision("120-240 min").

% Sección 1
alerta("1", 0).
alerta("2", 5).
alerta("3", 10).
alerta("4", 15).

apnea("1", 0).
apnea("2", 5).
apnea("3", 10).
apnea("4", 15).

ausencia_pulso("1", 0).
ausencia_pulso("2", 5).
ausencia_pulso("3", 10).
ausencia_pulso("4", 15).

intubacion("1", 0).
intubacion("2", 5).
intubacion("3", 10).
intubacion("4", 15).

angor("1", 0).
angor("2", 5).
angor("3", 10).
angor("4", 15).

% Sección 2
traumatismo("1", 0).
traumatismo("2", 5).
traumatismo("3", 10).
traumatismo("4", 15).

heridas("1", 0).
heridas("2", 5).
heridas("3", 10).
heridas("4", 15).

trabajo_respiratorio("1", 0).
trabajo_respiratorio("2", 5).
trabajo_respiratorio("3", 10).
trabajo_respiratorio("4", 15).

cianosis("1", 0).
cianosis("2", 5).
cianosis("3", 10).
cianosis("4", 15).

palidez("1", 0).
palidez("2", 5).
palidez("3", 10).
palidez("4", 15).

hemorragia("1", 0).
hemorragia("2", 5).
hemorragia("3", 10).
hemorragia("4", 15).

dolor("1", 0).
dolor("2", 5).
dolor("3", 10).
dolor("4", 15).

intoxicacion("1", 0).
intoxicacion("2", 10).
intoxicacion("3", 15).

convulsiones("1", 0).
convulsiones("2", 10).
convulsiones("3", 15).

giasgow_neurologico("1", 0).
giasgow_neurologico("2", 5).
giasgow_neurologico("3", 10).
giasgow_neurologico("4", 15).

deshidratacion("1", 0).
deshidratacion("2", 5).
deshidratacion("3", 10).
deshidratacion("4", 15).

psicosis_agitacion_violencia("1", 0).
psicosis_agitacion_violencia("2", 0).
psicosis_agitacion_violencia("3", 15).
psicosis_agitacion_violencia("4", 15).

frecuencia_cardiaca("1", 10).
frecuencia_cardiaca("2", 5).
frecuencia_cardiaca("3", 0).
frecuencia_cardiaca("4", 5).
frecuencia_cardiaca("5", 10).

temperatura("1", 10).
temperatura("2", 5).
temperatura("3", 0).
temperatura("4", 5).
temperatura("5", 10).

frecuencia_respiratoria("1", 10).
frecuencia_respiratoria("2", 5).
frecuencia_respiratoria("3", 0).
frecuencia_respiratoria("4", 5).
frecuencia_respiratoria("5", 10).

tension_arterial("1", 10).
tension_arterial("2", 5).
tension_arterial("3", 0).
tension_arterial("4", 5).
tension_arterial("5", 10).

glucemia("1", 10).
glucemia("2", 5).
glucemia("3", 0).
glucemia("4", 5).
glucemia("5", 10).

% Total calculation
total([], 0).
total([X|Y], Sum) :-
    total(Y, Rest),
    Sum is X + Rest.

% Decision based on total score
decision_final(Total, "inmediata") :- Total >= 0, Total =< 5.
decision_final(Total, "15 min") :- Total >= 6, Total =< 10.
decision_final(Total, "30-60 min") :- Total >= 11, Total =< 20.
decision_final(Total, "60-120 min") :- Total >= 21, Total =< 30.
decision_final(Total, "120-240 min") :- Total > 30.

% Triage process
triage :-
    write("Ingrese el grado de traumatismo: "), 
    write("1: Ausente, 2: Menor, 3: Moderado, 4: Mayor"), nl,
    read(Trauma),
    traumatismo(Trauma, P1),
    write("Ingrese el grado de heridas: "), read(Heridas),
    heridas(Heridas, P2),
    write("Ingrese el grado de aumento de trabajo respiratorio: "), read(Resp),
    trabajo_respiratorio(Resp, P3),
    write("Ingrese el grado de cianosis: "), read(Cianosis),
    cianosis(Cianosis, P4),
    write("Ingrese el grado de palidez: "), read(Palidez),
    palidez(Palidez, P5),
    write("Ingrese el grado de hemorragia: "), read(Hemorragia),
    hemorragia(Hemorragia, P6),
    write("Ingrese el grado de dolor visible: "), read(Dolor),
    dolor(Dolor, P7),
    write("Ingrese el grado de intoxicación o auto daño: "), read(Intox),
    intoxicacion(Intox, P8),
    write("Ingrese el grado de convulsiones: "), read(Conv),
    convulsiones(Conv, P9),
    write("Ingrese el grado de Giasgow neurologico: "), read(Glasgow),
    giasgow_neurologico(Glasgow, P10),
    write("Ingrese el grado de deshidratación: "), read(Deshid),
    deshidratacion(Deshid, P11),
    write("Ingrese el grado de psicosis, agitación o violencia: "), read(Psico),
    psicosis_agitacion_violencia(Psico, P12),
    write("Ingrese el grado de frecuencia cardiaca: "), read(Cardiaca),
    frecuencia_cardiaca(Cardiaca, P13),
    write("Ingrese el grado de temperatura: "), read(Temp),
    temperatura(Temp, P14),
    write("Ingrese el grado de frecuencia respiratoria: "), read(FResp),
    frecuencia_respiratoria(FResp, P15),
    write("Ingrese el grado de tensión arterial: "), read(Tension),
    tension_arterial(Tension, P16),
    write("Ingrese el grado de glucemia: "), read(Gluc),
    glucemia(Gluc, P17),
    % Calcula el puntaje total
    total([P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17], Total),
    % Determina la decisión final
    decision_final(Total, Decision),
    write("La decisión final es: "), write(Decision), nl.