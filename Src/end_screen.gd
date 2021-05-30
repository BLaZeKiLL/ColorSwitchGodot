extends MarginContainer

signal restart

onready var _score = $VBoxContainer/Score

var _is_game_over := false

func _process(_delta):
	if _is_game_over and Input.is_action_just_pressed("ui_select"):
		emit_signal("restart")
		hide()


func show_end_screen(score: int) -> void:
	_score.text = String(score)
	_is_game_over = true
	show()
