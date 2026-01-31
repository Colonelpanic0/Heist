extends Node2D

@export var npc_scene: PackedScene
@export var security_scene: PackedScene

@export var max_npcs = 5
@export var max_security = 2
@export var spawn_interval_min = 2.0
@export var spawn_interval_max = 5.0

var active_npcs = 0
var active_security = 0
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

	if active_security < max_security:
		var val = randi_range(1, max_npcs - active_npcs)
		if val == 1:
			instance = security_scene.instantiate()
			active_security+=1
			instance.tree_exited.connect(_on_security_despawned)
			instance.position=position
			get_parent().add_child(instance)
			return
			
	instance.tree_exited.connect(_on_npc_despawned)
	instance.position=position
	get_parent().add_child(instance)
	active_npcs += 1

func _on_npc_despawned():
	active_npcs -= 1
	

func _on_security_despawned():
	active_security -= 1
