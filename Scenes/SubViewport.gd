extends SubViewport

@export var player: Node3D
@export var world_extents: Rect2
@export var paint_brush : Sprite2D

func _ready():
	pass

func _process(delta):
	var half_world_extents = world_extents.size * 0.5;
	var player_pos = Vector2(player.position.x, player.position.z)
	
	player_pos += half_world_extents
	var paintbrush_position = player_pos / world_extents.size
	
	paint_brush.position = paint_brush.position * Vector2(size.x, size.y)
