extends Node2D

# Export array of prefab scenes - set these in the editor
@export var level_prefabs: Array[PackedScene] = []
@export var statusbar_prefab: PackedScene

@export var guest_generator: PackedScene
@export var worker_generator: PackedScene
@export var security_generator: PackedScene

@export var player_prefab: PackedScene

@export var gem_prefab: PackedScene

@export var ascend_prefab: PackedScene

#@export var current_level: int = 0

func _ready():
	Singleton.gamestart = true
	build_level()
	build_generators()
	build_statusbar()
	Singleton.timer = 100

func build_level():
	# Randomly choose how many prefabs to use (3 to 5)
	#var num_prefabs = randi() % 3 + 3  # Random number between 3 and 5
	
	# Calculate total height of all prefabs
	var total_height = (Singleton.level + 3) * Singleton.ROOM_HEIGHT
	
	# Calculate starting Y position to center vertically
	# Available height is viewport minus status bar
	var available_height = Singleton.VIEWPORT_HEIGHT - Singleton.STATUS_BAR_HEIGHT
	var start_y = (available_height - total_height) / 2.0
	
	# Instance and position each prefab
	for i in range(Singleton.level + 3):
		# Pick a random prefab from the array
		var prefab_scene = level_prefabs[randi() % level_prefabs.size()]
		var instance = prefab_scene.instantiate()
		
		# Position it
		instance.position.y = start_y + (i * Singleton.ROOM_HEIGHT)
		
		# Add to scene
		add_child(instance)
		
func build_statusbar():
	var instance = statusbar_prefab.instantiate()
	instance.position.y=Singleton.VIEWPORT_HEIGHT-Singleton.STATUS_BAR_HEIGHT
	add_child(instance)

func build_generators():
	var total_height = (Singleton.level + 3) * Singleton.ROOM_HEIGHT
	
	# Calculate starting Y position to center vertically
	# Available height is viewport minus status bar
	var available_height = Singleton.VIEWPORT_HEIGHT - Singleton.STATUS_BAR_HEIGHT
	var start_y = (available_height - total_height) / 2.0
	
	match (Singleton.level):
		0:
			var instance = guest_generator.instantiate()
			instance.position.y = start_y + (3*Singleton.ROOM_HEIGHT) - Singleton.NPC_HEIGHT - Singleton.FLOOR_HEIGHT
			instance.position.x=Singleton.VIEWPORT_WIDTH
			instance.max_npcs=10
			add_child(instance)
			instance = worker_generator.instantiate()
			instance.position.y = start_y + (2*Singleton.ROOM_HEIGHT) - Singleton.NPC_HEIGHT - Singleton.FLOOR_HEIGHT
			instance.position.x=Singleton.VIEWPORT_WIDTH
			add_child(instance)
			instance = security_generator.instantiate()
			instance.position.y = start_y + (Singleton.ROOM_HEIGHT) - Singleton.NPC_HEIGHT - Singleton.FLOOR_HEIGHT
			instance.position.x=Singleton.VIEWPORT_WIDTH
			add_child(instance)
			instance = player_prefab.instantiate()
			instance.position.y = start_y + (3*Singleton.ROOM_HEIGHT) - Singleton.NPC_HEIGHT - Singleton.FLOOR_HEIGHT - 8
			instance.position.x = 28
			add_child(instance)
			instance = gem_prefab.instantiate()
			instance.position.y = start_y + (Singleton.ROOM_HEIGHT) - Singleton.NPC_HEIGHT - Singleton.FLOOR_HEIGHT - 20
			instance.position.x = Singleton.VIEWPORT_WIDTH-75
			add_child(instance)
			#add ascension zones
			instance = ascend_prefab.instantiate()
			instance.position.y = start_y + (Singleton.ROOM_HEIGHT)
			instance.position.x = Singleton.VIEWPORT_WIDTH
			add_child(instance)
			instance = ascend_prefab.instantiate()
			instance.position.y = start_y
			instance.position.x = -40
			add_child(instance)
