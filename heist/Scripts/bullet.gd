extends CharacterBody2D


const SPEED = 150.0
@export var speed = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	velocity.x = speed * SPEED
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
