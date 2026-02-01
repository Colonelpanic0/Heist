extends CharacterBody2D
@export var playerSprite: AnimatedSprite2D
@export var playerAnims: Array[SpriteFrames] = []
@export var playerMask: Sprite2D
@export var masks: Array[Texture2D] = []

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
			update_anim("walk")
			looking = 1
			playerSprite.flip_h = false
			GUN.flip_h = false
			GUN.position.x = POS_R.x
			
		elif direction <= -1:
			update_anim("walk")
			looking = -1 
			playerSprite.flip_h = true
			GUN.flip_h = true
			GUN.position.x = POS_L.x
			
	else:
		update_anim("default")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func get_looking():
	return looking
	

# Used to update the animations
func update_anim(name:String) -> void:
	playerSprite.play(name)

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
				mask = Singleton.Disguise.MAINTENANCE
				playerSprite.sprite_frames = playerAnims[2]
				#update_anim("default")
				playerMask.texture = masks[1]
				playerMask.visible = true
			Singleton.Disguise.MAINTENANCE:	
				mask = Singleton.Disguise.WAITER
				#update_anim("default")
				playerSprite.sprite_frames = playerAnims[3]
				playerMask.texture = masks[2]
				playerMask.visible = true	
			Singleton.Disguise.WAITER:	
				mask = Singleton.Disguise.SECURITY
				playerSprite.sprite_frames = playerAnims[4]
				playerMask.texture = masks[3]
				playerMask.visible = true	
			Singleton.Disguise.SECURITY:	
				mask = Singleton.Disguise.GUEST
				playerMask.texture = masks[0]
				playerSprite.sprite_frames = playerAnims[1]
				playerMask.visible = true
			_:	
				Singleton.mask = Singleton.Disguise.GUEST
				playerMask.texture = masks[0]
				playerSprite.sprite_frames = playerAnims[1]
				playerMask.visible = true
				
		
		
