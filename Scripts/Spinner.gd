extends Node3D
@export var axis: Vector3 = Vector3.UP
@export var angle: float = 1

func _process(delta):
	rotate_object_local(axis.normalized(), angle * delta)
