extends Node3D

@onready var tween := create_tween()

var start_pos: Vector3
var end_pos := Vector3(0, 0, 10)

var previous_pos: Vector3  # Para calcular cuanto se movió la plataforma

func _ready():
	start_pos = global_transform.origin
	previous_pos = start_pos
	mover_plataforma()


func mover_plataforma():
	tween.tween_property(self, "global_transform:origin", start_pos + end_pos, 2)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	tween.tween_property(self, "global_transform:origin", start_pos, 2)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	tween.set_loops()


func _process(delta):
	# Actualiza la posición anterior cada frame
	previous_pos = global_transform.origin


func _on_body_entered(body):
	if body.is_in_group("player"):
		body.current_platform = self


func _on_body_exited(body):
	if body.is_in_group("player"):
		body.current_platform = null
