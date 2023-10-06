extends Node3D

@export var sensitivity: float = 0.001
@export var cam: Node3D
@export var wobbleSensitivity: float = 1
@export var character: CharacterBody3D = null
var currentWobble: float = 0
var wobbleLerpAmount: float = 10
var wobbleStrength: float = 0.005
var walkspeedAlongX = 0
var walkspeedAlongXMultiplier = 10
var currentAim = 0
var timePassed = 0

func _init():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	currentAim = 0.0

func _process(delta):
	timePassed += delta
	if timePassed < 1:
		return
	
	walkspeedAlongX = character.velocity.normalized().dot(basis.x) * walkspeedAlongXMultiplier
	
	currentWobble = lerp(currentWobble, currentAim + walkspeedAlongX, wobbleLerpAmount * delta)
	cam.rotation.z = currentWobble * wobbleStrength

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * sensitivity)
		cam.rotate_x(-event.relative.y * sensitivity)
		cam.rotation = Vector3(clamp(cam.rotation.x, deg_to_rad(-90), deg_to_rad(90)), 0, 0)
		currentAim = event.relative.x
		
		#print(Vector3(rad_to_deg(cam.rotation.x), rad_to_deg(cam.rotation.y), rad_to_deg(cam.rotation.z)))
		#print(Vector3(cam.rotation.x, cam.rotation.y, cam.rotation.z))
