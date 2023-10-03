extends Camera3D

@export var sensitivity: float
var mouse_pos: Vector2

func _init():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	if Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED:
		return
	
	mouse_pos = get_viewport().get_mouse_position() * sensitivity
	print(mouse_pos)
	var yaw = mouse_pos.x
	var pitch = mouse_pos.y
	
	pitch = clamp(pitch, -90, 90)
	
	rotate_y(deg_to_rad(-yaw))
	rotate_object_local(Vector3(1,0,0), deg_to_rad(-pitch))
