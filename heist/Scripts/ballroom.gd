extends Node2D

@export var shadow_min :int = 2
@export var shadow_max :int = 4

@export var shadow_prefab: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var shadow_num :int = randi_range(shadow_min,shadow_max)
	
	var min_distance = 50  # adjust this for how far apart they should be
	var placed_positions = []
	
	for i in range(shadow_num):
		var valid_position = false
		var new_x = 0
		var attempts = 0
		
		while not valid_position and attempts < 100:
			new_x = randf_range(150, Singleton.VIEWPORT_WIDTH - 150)
			valid_position = true
			
			# Check distance from all previously placed positions
			for pos in placed_positions:
				if abs(new_x - pos) < min_distance:
					valid_position = false
					break
			
			attempts += 1
		
		if valid_position:
			placed_positions.append(new_x)
			var shadow_y = Singleton.ROOM_HEIGHT - Singleton.FLOOR_HEIGHT - Singleton.SHADOW_HEIGHT
			
			# Do whatever you need with new_x and shadow_y here
			
			var instance = shadow_prefab.instantiate()
			instance.position.x = new_x
			instance.position.y = shadow_y
			add_child(instance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
