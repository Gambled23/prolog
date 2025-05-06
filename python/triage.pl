% filepath: /home/gambled/Codes/prolog/triage.pl

% Facts
decision("inmediata").
decision("15 min").
decision("30-60 min").
decision("60-120 min").
decision("120-240 min").

% Sección 1
alerta("Ausente", 0).
alerta("Leve", 5).
alerta("Moderado", 10).
alerta("Severo", 15).

apnea("Ausente", 0).
apnea("Leve", 5).
apnea("Moderado", 10).
apnea("Severo", 15).

ausencia_pulso("Ausente", 0).
ausencia_pulso("Leve", 5).
ausencia_pulso("Moderado", 10).
ausencia_pulso("Severo", 15).

intubacion("Ausente", 0).
intubacion("Leve", 5).
intubacion("Moderado", 10).
intubacion("Severo", 15).

angor("Ausente", 0).
angor("Leve", 5).
angor("Moderado", 10).
angor("Severo", 15).

% Sección 2
traumatismo("Ausente", 0).
traumatismo("Menor", 5).
traumatismo("Moderado", 10).
traumatismo("Mayor", 15).

heridas("Ausente", 0).
heridas("Superficial", 5).
heridas("No permanente", 10).
heridas("Extensa-profunda", 15).

trabajo_respiratorio("Ausente", 0).
trabajo_respiratorio("Leve", 5).
trabajo_respiratorio("Moderado", 10).
trabajo_respiratorio("Severo", 15).

cianosis("Ausente", 0).
cianosis("Leve", 5).
cianosis("Moderado", 10).
cianosis("Severo", 15).

palidez("Ausente", 0).
palidez("Leve", 5).
palidez("Moderado", 10).
palidez("Severo", 15).

hemorragia("Ausente", 0).
hemorragia("Inactiva-Leve", 5).
hemorragia("Moderado", 10).
hemorragia("Severo", 15).

dolor("0", 0).
dolor("1-4", 5).
dolor("5-8", 10).
dolor("9-10", 15).

intoxicacion("Ausente", 0).
intoxicacion("Dudosa", 10).
intoxicacion("Evidente", 15).

convulsiones("Ausente", 0).
convulsiones("Edo. Postictal", 10).
convulsiones("Presente", 15).

giasgow_neurologico("15", 0).
giasgow_neurologico("14 al 12", 5).
giasgow_neurologico("11 al 8", 10).
giasgow_neurologico("<8", 15).

deshidratacion("Ausente", 0).
deshidratacion("Leve", 5).
deshidratacion("Moderada", 10).
deshidratacion("Severa", 15).

psicosis_agitacion_violencia("Ausente", 0).
psicosis_agitacion_violencia("Presente", 15).

frecuencia_cardiaca("<40", 10).
frecuencia_cardiaca("40-50", 5).
frecuencia_cardiaca("60-100", 0).
frecuencia_cardiaca("101-140", 5).
frecuencia_cardiaca(">140", 10).

temperatura("<34.5", 10).
temperatura("34.5-35.9", 5).
temperatura("36-37", 0).
temperatura("37.1-39", 5).
temperatura(">39", 10).

frecuencia_respiratoria("<8", 10).
frecuencia_respiratoria("8-12", 5).
frecuencia_respiratoria("13-18", 0).
frecuencia_respiratoria("19-25", 5).
frecuencia_respiratoria(">25", 10).

tension_arterial("<70/50", 10).
tension_arterial("70/50-90/60", 5).
tension_arterial("91/61-12/80", 0).
tension_arterial("121/81-160/110", 5).
tension_arterial(">180/110", 10).

glucemia("<40", 10).
glucemia("40-60", 5).
glucemia("61-140", 0).
glucemia("141-400", 5).
glucemia(">400", 10).