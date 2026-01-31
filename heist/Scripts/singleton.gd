extends Node

@export var lives: int
@export var bullets: int
@export var loop: int
@export var level: int
@export var alarmed: bool
@export var gem_collected: bool
@export var mask : Disguise

const FLOOR_HEIGHT = 19
const ROOM_HEIGHT = 116
const GAME_WIDTH = 1152
const VIEWPORT_HEIGHT = 648
const VIEWPORT_WIDTH = 1152
const STATUS_BAR_HEIGHT = 64
const NPC_HEIGHT = 40
const SHADOW_HEIGHT = ROOM_HEIGHT - FLOOR_HEIGHT

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
