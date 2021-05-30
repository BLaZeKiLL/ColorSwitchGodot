extends Area2D


func _on_body_entered(body: Node2D):
	if body.has_method("color_switch"):
		body.call("color_switch")
		hide()
