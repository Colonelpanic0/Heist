extends Node

@export var lives: int
@export var bullets: int
@export var loop: int
@export var level: int
@export var alarmed: bool
@export var gem_collected: bool
@export var mask : Disguise

enum Disguise {
	GUEST,
	WORKER,
	SECURITY
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lives = 3
	bullets = 3
	loop = 0
	level = 0
	alarmed = false
	mask = Disguise.GUEST
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
