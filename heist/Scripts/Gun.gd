extends Sprite2D

@onready var sprite_2d: Sprite2D = $"."
const BULLET = preload("uid://c4d104xnavy54")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Fire"): 
		if Singleton.bullets >= 1:
			#Fire bullet
			pass
		pass
	
	pass
