extends Area2D


func _on_body_entered(body: Node2D):
	if body.has_method("increase_score"):
		body.call("increase_score")
		hide()
