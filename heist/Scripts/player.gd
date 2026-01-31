extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

@export var looking = 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		if direction >= 1: 
			looking = 1
			sprite_2d.flip_h = false
		elif direction <= -1:
			looking = -1 
			sprite_2d.flip_h = true
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
