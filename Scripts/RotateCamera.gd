extends Node3D

@export var sensitivity: float = 0.001
@export var cam: Node3D
@export var camWobble: Node3D
@export var wobbleSensitivity: float = 1
var boingo: float = 0

func _init():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	#camWobble.rotate_z(event.relative.x * wobbleSensitivity)
	pass

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * sensitivity)
		cam.rotate_x(-event.relative.y * sensitivity)
		cam.rotation = Vector3(clamp(cam.rotation.x, deg_to_rad(-90), deg_to_rad(90)), 0, 0)
		
		#boingo = event.relative.x
		
		#print(Vector3(rad_to_deg(cam.rotation.x), rad_to_deg(cam.rotation.y), rad_to_deg(cam.rotation.z)))
		#print(Vector3(cam.rotation.x, cam.rotation.y, cam.rotation.z))
