extends Node

@export var lives: int
@export var bullets: int
@export var loop: int
@export var level: int
@export var alarmed: bool
@export var gem_collected: bool
@export var mask : Disguise
@export var hidden: bool
@export var score: int
@export var timer: int
@export var gamestart: bool

var time_accumulator = 0.0

const FLOOR_HEIGHT = 19
const ROOM_HEIGHT = 116
const GAME_WIDTH = 1152
const VIEWPORT_HEIGHT = 648
const VIEWPORT_WIDTH = 1152
const STATUS_BAR_HEIGHT = 64
const NPC_HEIGHT = 48
const SHADOW_HEIGHT = ROOM_HEIGHT - FLOOR_HEIGHT

enum Disguise {
	GUEST,
	WORKER,
	SECURITY
}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gamestart = false
	lives = 3
	bullets = 3
	loop = 0
	level = 0
	alarmed = false
	mask = Disguise.GUEST
	hidden = false
	timer = 100



func _process(delta):
	if gamestart:
		time_accumulator += delta
		if time_accumulator >= 1.0:
			time_accumulator -= 1.0
			timer -= 1
			if timer == 0:
				lives-=1
				if lives == 0:
					_game_over()
				else:
					get_tree().change_scene_to_file("res://Scenes/playablenew.tscn")
					timer = 100

func _game_over():
	gamestart = false
	get_tree().change_scene_to_file("res://Scenes/frontendnew.tscn")
	lives = 3
	bullets = 3
	loop = 0
	level = 0
	alarmed = false
	mask = Disguise.GUEST
	hidden = false
	timer = 0
