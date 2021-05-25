extends Node2D

onready var _player := $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	_player.set_active(true)


func _on_game_over() -> void:
	_player.set_active(false)
	print("Game Over")
