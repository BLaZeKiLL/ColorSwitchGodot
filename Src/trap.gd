extends Area2D

onready var _color_node := $ColorNode


func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")


func _on_body_entered(body: Node) -> void:
	if (body.has_method("on_hit")):
		body.call("on_hit", _color_node.current_color)
