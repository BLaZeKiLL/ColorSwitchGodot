extends Area2D


export var action: String


onready var _collision = $CollisionShape2D


func _on_body_entered(body: Node2D):
	if body.has_method(action):
		body.call(action)
		set_active(false)

func set_active(state: bool) -> void:
	if state: show()
	else: hide()
	_collision.set_deferred("disabled", not state)
