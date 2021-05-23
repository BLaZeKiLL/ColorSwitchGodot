extends Sprite

class_name ColorNode

const COLORS = [Color("#32DBF0"), Color("#FF0181"), Color("#900DFF"), Color("#FAE100")]

export (int) var current_color = 0


func _ready() -> void:
	modulate = COLORS[current_color]


func set_current_color(new_value: int) -> void:
	current_color = new_value
	modulate = COLORS[current_color]
