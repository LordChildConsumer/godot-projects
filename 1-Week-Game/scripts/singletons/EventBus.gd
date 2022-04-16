extends Node

# --- Misc Signals ---
signal quit_Game()

# --- Management Signals ---
signal switch_Scene(newScene)

# --- Gameplay Signals ---
signal _tomato_Harvested()
signal _carrot_Harvested()

# -- UI Signals ---
signal _show_Text_Small(args)
signal _show_Text_Large(args)
