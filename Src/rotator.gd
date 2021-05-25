extends Node2D

export var rot_speed := 1.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation_degrees += 180 * delta * rot_speed
