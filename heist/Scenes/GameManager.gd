extends Node2D

# Export array of prefab scenes - set these in the editor
@export var level_prefabs: Array[PackedScene] = []
@export var statusbar_prefab: PackedScene

@export var guest_generator: PackedScene

var current_level: int = 0

const PREFAB_HEIGHT = 116
const VIEWPORT_HEIGHT = 648
const VIEWPORT_WIDTH = 1152
const STATUS_BAR_HEIGHT = 64
const FLOOR_HEIGHT = 19
const NPC_HEIGHT = 40

func _ready():
	build_level()
	build_generators()
	build_statusbar()

func build_level():
	# Randomly choose how many prefabs to use (3 to 5)
	#var num_prefabs = randi() % 3 + 3  # Random number between 3 and 5
	
	# Calculate total height of all prefabs
	var total_height = (current_level + 3) * PREFAB_HEIGHT
	
	# Calculate starting Y position to center vertically
	# Available height is viewport minus status bar
	var available_height = VIEWPORT_HEIGHT - STATUS_BAR_HEIGHT
	var start_y = (available_height - total_height) / 2.0
	
	# Instance and position each prefab
	for i in range(current_level + 3):
		# Pick a random prefab from the array
		var prefab_scene = level_prefabs[randi() % level_prefabs.size()]
		var instance = prefab_scene.instantiate()
		
		# Position it
		instance.position.y = start_y + (i * PREFAB_HEIGHT)
		
		# Add to scene
		add_child(instance)
		
func build_statusbar():
	var instance = statusbar_prefab.instantiate()
	instance.position.y=VIEWPORT_HEIGHT-STATUS_BAR_HEIGHT
	add_child(instance)

func build_generators():
	var total_height = (current_level + 3) * PREFAB_HEIGHT
	
	# Calculate starting Y position to center vertically
	# Available height is viewport minus status bar
	var available_height = VIEWPORT_HEIGHT - STATUS_BAR_HEIGHT
	var start_y = (available_height - total_height) / 2.0
	
	match (current_level):
		0:
			var instance = guest_generator.instantiate()
			instance.position.y = start_y + (3*PREFAB_HEIGHT) - NPC_HEIGHT - FLOOR_HEIGHT
			instance.position.x=VIEWPORT_WIDTH
			add_child(instance)
