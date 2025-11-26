extends Node3D

@onready var tween := create_tween()

var start_pos
var end_pos := Vector3(0, 0, -10) # Mover a la izquierda
var last_pos : Vector3
var player_on_top : CharacterBody3D = null

func _ready():
	start_pos = global_position
	last_pos = global_position
	mover_plataforma()
	
func mover_plataforma():
	tween.tween_property(self, "global_position", start_pos + end_pos, 2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "global_position", start_pos, 2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.set_loops()

func _process(delta):
	# Cuánto se movió la plataforma en este frame
	var move_amount = global_position - last_pos

	# Si el jugador está encima, aplicamos el desplazamiento usando move_and_slide
	if player_on_top != null:
		# Nota: Velocity solo se aplica temporalmente para este movimiento
		player_on_top.velocity += move_amount / delta  # convertir desplazamiento a velocidad
		player_on_top.move_and_slide()

	last_pos = global_position

# --- Área detecta jugador ---
func _on_area_3d_body_entered(body):
	if body.is_class("CharacterBody3D"):  
		player_on_top = body

func _on_area_3d_body_exited(body):
	if body == player_on_top:
		player_on_top = null
