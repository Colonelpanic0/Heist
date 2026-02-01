extends CharacterBody2D
@export var playerSprite: AnimatedSprite2D
@export var playerMask: Sprite2D
@export var guestMask: Texture2D
@export var GUN: Sprite2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
@export var POS_L = Vector2(-20,5)
@export var POS_R = Vector2(20,5)
@export var looking = 1
@export var mask = Singleton.Disguise.GUEST

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
			playerSprite.flip_h = false
			GUN.flip_h = false
			GUN.position.x = POS_R.x
			
		elif direction <= -1:
			looking = -1 
			playerSprite.flip_h = true
			GUN.flip_h = true
			GUN.position.x = POS_L.x
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func get_looking():
	return looking
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Singleton.hidden:
		playerSprite.self_modulate.a = 0.1
		#hide = true
	elif not Singleton.hidden :
		playerSprite.self_modulate.a = 1
		#hide = false
	
	if Input.is_action_just_pressed("Special") and Singleton.hidden:
		match mask:
			Singleton.Disguise.GUEST:	
				Singleton.mask = Singleton.Disguise.WORKER
				playerMask.texture = guestMask
				playerMask.visible = true
			Singleton.Disguise.WORKER:
				Singleton.mask = Singleton.Disguise.SECURITY
				playerMask.texture = guestMask
				playerMask.visible = true	
			Singleton.Disguise.SECURITY:
				Singleton.mask = Singleton.Disguise.GUEST
				playerMask.texture = guestMask
				playerMask.visible = true
			_:
				Singleton.mask = Singleton.Disguise.GUEST
				playerMask.texture = guestMask
				playerMask.visible = true
				
		
		
