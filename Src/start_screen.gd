extends MarginContainer

signal start


func _process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		emit_signal("start")
		hide()
