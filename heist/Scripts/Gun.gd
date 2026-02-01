extends Sprite2D

@export var player: CharacterBody2D  
@export var bullet_prefab: PackedScene #Define the bullet scene here
@export var bullet_offset: Vector2
@export var bullet_speed = 4
@export var bullet_spawn: Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Fire"): 
		if Singleton.bullets >= 1:
			#Fire bullet
			var instance = bullet_prefab.instantiate() #creates an instance
			#var parent = get_parent()
			instance.position.x = bullet_spawn.global_position.x * player.get_looking() #+ bullet_offset.x #set position etc.
			instance.position.y = bullet_spawn.global_position.y #+ bullet_offset.y
			instance.speed = bullet_speed * player.get_looking()
			get_parent().get_parent().add_child(instance) #adds the instance into the scene
			pass
		pass
	
	pass
