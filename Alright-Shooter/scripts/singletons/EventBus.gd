extends Node

# --- Misc Signals ---
signal quitGame()

# --- Management Signals ---
signal switchScene(newScene)

# --- Effect Signals ---
signal shakePlayerCamera(new_shake, shake_time, shake_limit)
signal spawnParticles(pos, mat, amount, life, norm)

# --- Player Stat Signals ---
signal _on_Set_Attack_Speed(value)

# --- Gameplay Signals ---
