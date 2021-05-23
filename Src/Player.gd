extends KinematicBody2D

export var jump_speed := 1000 # used as impulse
export var gravity := 1000

onready var _color_node := $ColorNode

var _velocity := Vector2()


func _ready() -> void:
	randomize()
	_color_node.set_current_color(randi() % _color_node.COLORS.size())


func _physics_process(delta) -> void:
	_velocity.y += Vector2.DOWN.y * gravity * delta
	_get_input()
	_velocity = move_and_slide(_velocity)
	pass


func _get_input() -> void:
	_velocity.x = 0
	
	if Input.is_action_just_pressed("ui_select"):
		_velocity.y = Vector2.UP.y * jump_speed

