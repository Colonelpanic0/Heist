extends Sprite2D

@export var player:  CharacterBody2D  
@export var bullet_prefab: PackedScene #Define the bullet scene here
@export var bullet_offset = 100
@export var bullet_speed = 4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Fire"): 
		if Singleton.bullets >= 1:
			#Fire bullet
			var instance = bullet_prefab.instantiate() #creates an instance
			instance.position.x = position.x + player.looking * bullet_offset #set position etc.
			instance.position.y = position.y
			instance.speed = bullet_speed
			get_parent().add_child(instance) #adds the instance into the scene
			pass
		pass
	
	pass
