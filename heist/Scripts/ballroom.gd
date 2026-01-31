extends Node2D

@export var shadow_min :int = 2
@export var shadow_max :int = 4

@export var shadow_prefab: PackedScene

const FLOOR_HEIGHT: int = 19
const ROOM_HEIGHT: int = 116
const GAME_WIDTH: int = 1152


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var shadownum :int = randi_range(shadow_min,shadow_max)
	
	#for
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
