extends Node2D

onready var _player := $Player
onready var _gui := $UI/InGame
onready var _end_screen := $UI/EndScreen


func _ready() -> void:
	_gui.hide()
	_end_screen.hide()


func _on_game_over(score: int) -> void:
	_player.set_active(false)
	_gui.hide()
	_end_screen.show_end_screen(score)
	pass


func _on_game_start():
	_gui.show()
	_player.set_active(true)


func _on_game_restart():
	get_tree().reload_current_scene()
