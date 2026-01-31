extends Node2D

@export var npc_scene: PackedScene
@export var max_npcs = 5
@export var spawn_interval_min = 2.0
@export var spawn_interval_max = 5.0

var active_npcs = 0
var time_until_spawn = 0.0

func _ready():
	time_until_spawn = randf_range(spawn_interval_min, spawn_interval_max)

func _process(delta):
	time_until_spawn -= delta
	
	if time_until_spawn <= 0 and active_npcs < max_npcs:
		spawn_npc()
		time_until_spawn = randf_range(spawn_interval_min, spawn_interval_max)

func spawn_npc():
	var instance = npc_scene.instantiate()
	
	# Spawn from right side of viewport
	var viewport_width = get_viewport_rect().size.x
	#instance.global_position = Vector2(viewport_width + 50, global_position.y)
	
	# Track when NPC is freed
	instance.tree_exited.connect(_on_npc_despawned)
	
	get_parent().add_child(instance)
	active_npcs += 1

func _on_npc_despawned():
	active_npcs -= 1
