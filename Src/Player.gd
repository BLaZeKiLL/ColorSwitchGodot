extends KinematicBody2D

signal game_over

export var jump_speed := 1000 # used as impulse
export var gravity := 1000

onready var _color_node := $ColorNode
onready var _camera := $Camera2D
onready var _collision := $CollisionShape2D

var _velocity := Vector2()


func _ready() -> void:
	_color_node.set_current_color(randi() % _color_node.COLORS.size())


func _physics_process(delta: float) -> void:
	_velocity.y += Vector2.DOWN.y * gravity * delta
	_get_input()
	_velocity = move_and_slide(_velocity)


func on_hit(trap_color: int) -> void:
	if (_color_node.current_color == trap_color):
		pass
	else:
		_game_over()


func set_active(state: bool) -> void:
	if state: show()
	else: hide()
	
	$Camera2D.smoothing_enabled = state
	$CollisionShape2D.set_deferred("disabled", not state)
	
	set_process(state)
	set_physics_process(state)


func _get_input() -> void:
	_velocity.x = 0
	
	if Input.is_action_just_pressed("ui_select"):
		_velocity.y = Vector2.UP.y * jump_speed


func _game_over() -> void:
	emit_signal("game_over")


func _on_screen_exited() -> void:
	_game_over()
