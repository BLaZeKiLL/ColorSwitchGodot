extends MarginContainer

onready var _score := $NinePatchRect/Score


func _ready():
	_score.text = "0"


func _on_increase_score(score: int):
	_score.text = String(score)
