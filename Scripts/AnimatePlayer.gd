extends Node3D

@export var breathPS: GPUParticles3D
@export var timeTilBreatheMin: float = 1.25
@export var timeTilBreatheMax: float = 4
var timeTilBreatheActual: float = 4
var timeSinceBreathe: float = 0
var rng: RandomNumberGenerator

func _init():
	rng = RandomNumberGenerator.new()

func _process(delta):
	timeSinceBreathe += delta
	if timeSinceBreathe > timeTilBreatheActual:
		timeTilBreatheActual = rng.randf_range(timeTilBreatheMin, timeTilBreatheMax)
		timeSinceBreathe = 0
		breathPS.emitting = true
