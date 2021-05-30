extends KinematicBody2D

signal game_over(score)
signal increase_score(score)

export var jump_speed := 1250 # used as impulse
export var gravity := 2500
export var reclaim_zone := 3000

onready var _color_node := $ColorNode
onready var _camera := $Camera2D
onready var _collision := $CollisionShape2D
onready var _visibility := $Camera2D/Area2D/CollisionShape2D

var _velocity := Vector2()
var _score := 0


func _ready() -> void:
	_set_visibility_position()
	color_switch()
	set_active(false)


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
	
	_camera.smoothing_enabled = state
	_collision.set_deferred("disabled", not state)
	
	set_process(state)
	set_physics_process(state)


func color_switch() -> void:
	_color_node.set_current_color(randi() % _color_node.COLORS.size())


func increase_score() -> void:
	_score += 1
	emit_signal("increase_score", _score)


func _on_screen_exited() -> void:
	_game_over()


func _game_over() -> void:
	emit_signal("game_over", _score)


func _get_input() -> void:
	_velocity.x = 0
	
	if Input.is_action_just_pressed("ui_select"):
		_velocity.y = Vector2.UP.y * jump_speed


func _set_visibility_position() -> void:
	(_visibility.shape as RectangleShape2D).extents = Vector2(get_viewport_rect().size.x / 2, 20)
	_visibility.position = Vector2.DOWN * reclaim_zone
