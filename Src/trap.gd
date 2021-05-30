extends Node2D

class_name Trap

onready var _star := $Star
onready var _color_switch := $ColorSwitch


func activate_pickables() -> void:
	_star.call("set_active", true)
	_color_switch.call("set_active", true)
