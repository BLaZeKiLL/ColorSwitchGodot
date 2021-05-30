extends Node2D

onready var _player := $Player
onready var _gui := $UI/InGame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	_gui.hide()


func _on_game_over() -> void:
#	_player.set_active(false)
	pass


func _on_game_start():
	_gui.show()
	_player.set_active(true)
