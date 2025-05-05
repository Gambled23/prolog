import tkinter as tk
from tkinter import ttk
from tkinter import messagebox

# --- Data Representation (from Prolog Facts) ---

# Maps category technical name -> (Display Name, {Option: Points})
triage_categories = {
    "traumatismo": ("Traumatismo", {"Ausente": 0, "Menor": 5, "Moderado": 10, "Mayor": 15}),
    "heridas": ("Heridas", {"Ausente": 0, "Superficial": 5, "No permanente": 10, "Extensa-profunda": 15}),
    "trabajo_respiratorio": ("Aumento Trabajo Respiratorio", {"Ausente": 0, "Leve": 5, "Moderado": 10, "Severo": 15}),
    "cianosis": ("Cianosis", {"Ausente": 0, "Leve": 5, "Moderado": 10, "Severo": 15}),
    "palidez": ("Palidez", {"Ausente": 0, "Leve": 5, "Moderado": 10, "Severo": 15}),
    "hemorragia": ("Hemorragia", {"Ausente": 0, "Inactiva-Leve": 5, "Moderado": 10, "Severo": 15}),
    "dolor": ("Dolor (escala análoga visual 0-10)", {"0": 0, "1-4": 5, "5-8": 10, "9-10": 15}),
    "intoxicacion": ("Intoxicación / Auto Daño", {"Ausente": 0, "Dudosa": 10, "Evidente": 15}),
    "convulsiones": ("Convulsiones", {"Ausente": 0, "Edo. Postictal": 10, "Presente": 15}),
    "giasgow_neurologico": ("Glasgow Neurológico (Escala)", {"15": 0, "14 al 12": 5, "11 al 8": 10, "<8": 15}),
    "deshidratacion": ("Deshidratación", {"Ausente": 0, "Leve": 5, "Moderada": 10, "Severa": 15}),
    "psicosis_agitacion_violencia": ("Psicosis / Agitación / Violencia", {"Ausente": 0, "Presente": 15}),
    "frecuencia_cardiaca": ("Frecuencia Cardíaca (X')", {"<40": 10, "40-50": 5, "60-100": 0, "101-140": 5, ">140": 10}),
    "temperatura": ("Temperatura (C)", {"<34.5": 10, "34.5-35.9": 5, "36-37": 0, "37.1-39": 5, ">39": 10}),
    "frecuencia_respiratoria": ("Frecuencia Respiratoria (X')", {"<8": 10, "8-12": 5, "13-18": 0, "19-25": 5, ">25": 10}),
    "tension_arterial": ("Tensión Arterial (mmHg)", {"<70/50": 10, "70/50-90/60": 5, "91/61-12/80": 0, "121/81-160/110": 5, ">180/110": 10}),
    "glucemia": ("Glucemia cap.", {"<40": 10, "40-60": 5, "61-140": 0, "141-400": 5, ">400": 10}),
}

# --- Decision Logic (from Prolog Rules) ---
def get_decision(total_score):
    """Determines the final decision based on the total score."""
    if 0 <= total_score <= 5:
        return "Atención en 120-240 min"
    elif 6 <= total_score <= 10:
        return "Atención en 60-120 min"
    elif 11 <= total_score <= 20:
        return "Atención en 30-60 min"
    elif 21 <= total_score <= 30:
        return "Atención en < 15 min"
    elif total_score > 30:
        return "Atención Inmediata"
    else:
        return "Puntaje inválido" # Should not happen with valid inputs

# --- GUI Functions ---
def calculate_triage():
    """Calculates the total score and determines the final decision."""
    total_score = 0
    try:
        for category_key, data in category_vars.items():
            selected_option = data["var"].get()
            if not selected_option:
                messagebox.showerror("Error de Entrada", f"Por favor seleccione una opción para '{data['display_name']}'.")
                return # Stop calculation if any field is empty

            # Look up points for the selected option in the specific category
            points = triage_categories[category_key][1].get(selected_option)
            if points is None:
                 messagebox.showerror("Error Interno", f"Opción inválida '{selected_option}' para '{data['display_name']}'.")
                 return # Stop if data is inconsistent

            total_score += points

        # Determine final decision
        decision = get_decision(total_score)

        # Update result labels
        total_score_var.set(f"Puntaje Total: {total_score}")
        decision_var.set(f"Decisión: {decision}")

    except Exception as e:
        messagebox.showerror("Error", f"Ocurrió un error durante el cálculo: {e}")
        total_score_var.set("Puntaje Total: Error")
        decision_var.set("Decisión: Error")


# --- GUI Setup ---
root = tk.Tk()
root.title("Sistema de Triage")
root.geometry("550x650") # Adjusted size for more inputs

# --- Scrollable Frame Setup ---
main_frame = ttk.Frame(root)
main_frame.pack(fill=tk.BOTH, expand=1)

canvas = tk.Canvas(main_frame)
canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=1)

scrollbar = ttk.Scrollbar(main_frame, orient=tk.VERTICAL, command=canvas.yview)
scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

canvas.configure(yscrollcommand=scrollbar.set)
canvas.bind('<Configure>', lambda e: canvas.configure(scrollregion=canvas.bbox("all")))

# This frame goes INSIDE the canvas and holds the widgets
scrollable_frame = ttk.Frame(canvas, padding="10")
canvas.create_window((0, 0), window=scrollable_frame, anchor="nw")

# --- Input Widgets ---
category_vars = {} # Dictionary to store StringVars for each category

# Create label and combobox for each category dynamically
for i, (key, (display_name, options_map)) in enumerate(triage_categories.items()):
    # Label
    label = ttk.Label(scrollable_frame, text=f"{display_name}:")
    label.grid(row=i, column=0, padx=5, pady=5, sticky="w")

    # Combobox (Dropdown)
    options = list(options_map.keys())
    combo_var = tk.StringVar(root)
    combobox = ttk.Combobox(scrollable_frame, textvariable=combo_var, values=options, state="readonly", width=25) # Readonly is important
    combobox.grid(row=i, column=1, padx=5, pady=5, sticky="ew")
    combobox.current(0) # Set default to the first option

    # Store the variable and display name for later access
    category_vars[key] = {"var": combo_var, "display_name": display_name}

# --- Calculation and Results Area (Below the scrollable frame) ---
results_frame = ttk.Frame(root, padding="10")
results_frame.pack(fill=tk.X, side=tk.BOTTOM)

calculate_button = ttk.Button(results_frame, text="Calcular Triage", command=calculate_triage)
calculate_button.pack(pady=10)

# Label for total score
total_score_var = tk.StringVar(root)
total_score_label = ttk.Label(results_frame, textvariable=total_score_var, font=("Arial", 12, "bold"))
total_score_label.pack(pady=2)
total_score_var.set("Puntaje Total: --")

# Label for final decision
decision_var = tk.StringVar(root)
decision_label = ttk.Label(results_frame, textvariable=decision_var, font=("Arial", 14, "bold"), foreground="blue")
decision_label.pack(pady=5)
decision_var.set("Decisión: --")


# --- Run the GUI ---
root.mainloop()