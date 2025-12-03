extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Script en el Area3D (o conectado con señal)
func get_overlapping_bodies():
	return $Area3D.get_overlapping_bodies()
