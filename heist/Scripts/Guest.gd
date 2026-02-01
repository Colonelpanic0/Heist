extends CharacterBody2D
@export var speed = 80.0

@export var guest_m :SpriteFrames
@export var guest_f :SpriteFrames
@export var worker :SpriteFrames
@export var guard :SpriteFrames

var direction = -1  # Start moving left
var time_until_turn = 0.0

@onready var sprite :AnimatedSprite2D = $Sprite

func _ready():
	time_until_turn = randf_range(7.0, 12.0)
	if sprite!=null:
		if randi_range(1,2) == 1:
			sprite.sprite_frames=guest_f
		
		sprite.play("walking")
		sprite.flip_h = true

func _physics_process(delta):
	velocity.x = direction * speed
	
	# Randomly change direction
	time_until_turn -= delta
	if time_until_turn <= 0:
		direction *= -1
		if sprite!=null:
			sprite.flip_h = not sprite.flip_h
		time_until_turn = randf_range(2.0, 7.0)
	
	# Turn around at walls
	if is_on_wall():
		direction *= -1
		if sprite!=null:
			sprite.flip_h = not sprite.flip_h
		time_until_turn = randf_range(3.0, 8.0)
	
	move_and_slide()
	
	# Despawn if off screen
	if global_position.x < -50 or global_position.x > get_viewport_rect().size.x + 50:
		queue_free()
