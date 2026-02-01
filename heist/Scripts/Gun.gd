extends Sprite2D

@export var player: CharacterBody2D  
@export var bullet_prefab: PackedScene #Define the bullet scene here
@export var bullet_offset: Vector2
@export var bullet_speed = 4
@export var bullet_spawn: Node2D
var hide = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Fire"): 
		if Singleton.bullets >= 1:
			#Fire bullet
			var instance = bullet_prefab.instantiate() #creates an instance
			
			instance.position.x = bullet_spawn.global_position.x + (bullet_offset.x * player.get_looking()) #set position etc.
			instance.position.y = bullet_spawn.global_position.y #+ bullet_offset.y
			instance.speed = bullet_speed * player.get_looking()
			if player.get_looking() < 1:
				instance.get_node("Sprite2D").flip_h = true
			else: 
				instance.get_node("Sprite2D").flip_h = false
			get_parent().get_parent().add_child(instance) #adds the instance into the scene
			Singleton.bullets -= 1
			pass
		pass
	if Singleton.hidden and not hide:
		self_modulate.a = 0.1
		hide = true
	elif not Singleton.hidden and hide:
		self_modulate.a = 1
		hide = false
	pass
