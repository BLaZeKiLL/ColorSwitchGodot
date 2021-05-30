extends Node2D


export (Array, PackedScene) var _traps : Array
export (int) var _entity_instance_count := 3
export (int) var _trap_seperation := 2000

onready var _reclaim_area := $"../Player/Camera2D/Area2D"

var _trap_pool := []
var _last_trap_position := Vector2(0, 1000)


func _ready() -> void:
# warning-ignore:return_value_discarded
	_reclaim_area.connect("area_entered", self, "_on_reclaim_area")
	_create_pool()
	call_deferred("_trap_claim")
	call_deferred("_trap_claim")


func _create_pool() -> void:
	for trap in _traps:
		for i in _entity_instance_count:
			_trap_pool.push_back(trap.instance())
	
#	_trap_pool.shuffle()
	print("Trap Pool Created Size : ", _trap_pool.size())


func _trap_claim() -> void:
	var trap : Node2D = _trap_pool.pop_back()
	
	_last_trap_position += Vector2.UP * _trap_seperation
	trap.position = _last_trap_position

	add_child(trap)
	print("Claiming : ", trap.name, " From : ", trap.position)
	print("=================================================")


func _trap_reclaim(trap: Node2D) -> void:
	print("Reclaiming : ", trap.name, " From : ", trap.position)
	remove_child(trap)
	_trap_pool.push_front(trap)


func _on_reclaim_area(body: Node2D) -> void:
	call_deferred("_trap_reclaim", body.get_parent())
	call_deferred("_trap_claim")
