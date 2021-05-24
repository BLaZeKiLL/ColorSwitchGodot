tool
extends Sprite

class_name ColorNode

const COLORS := [Color("#32DBF0"), Color("#FF0181"), Color("#900DFF"), Color("#FAE100")]

export (int, 3) var current_color := 0 setget set_current_color


func _ready() -> void:
	self_modulate = COLORS[current_color]


func set_current_color(new_value: int) -> void:
	current_color = new_value
	self_modulate = COLORS[current_color]
