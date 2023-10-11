extends SubViewport

@export var player: Node3D
@export var world_extents: Rect2
@export var paint_brush : Sprite2D
var player_body: CharacterBody3D

func _ready():
	player_body = player.get_child(0)

func _process(_delta):
	var half_world_extents = world_extents.size * 0.5
	var player_pos = Vector2(player_body.position.x, player_body.position.z)
	
	player_pos += half_world_extents
	var paintbrush_position = player_pos / world_extents.size

	paint_brush.position = paintbrush_position * size.x
