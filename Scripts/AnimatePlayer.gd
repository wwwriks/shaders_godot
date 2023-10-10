extends Node3D

@export var breathPS: GPUParticles3D
@export var timeTilBreatheMin: float = 1.25
@export var timeTilBreatheMax: float = 4
var timeTilBreatheActual: float = 4
var timeSinceBreathe: float = 0
var rng: RandomNumberGenerator

func _init():
	rng = RandomNumberGenerator.new()
	timeTilBreatheActual = get_breathe_time()

func _process(delta):
	if timeTilBreatheMin == 0.0 && timeTilBreatheMax == 0.0:
		return
	
	timeSinceBreathe += delta
	if timeSinceBreathe > timeTilBreatheActual:
		timeTilBreatheActual = get_breathe_time()
		timeSinceBreathe = 0
		play_breathe_fx()

func get_breathe_time():
	return rng.randf_range(timeTilBreatheMin, timeTilBreatheMax)

func play_breathe_fx():
	breathPS.emitting = true
