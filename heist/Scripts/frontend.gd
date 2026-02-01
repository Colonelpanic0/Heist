extends CanvasLayer

@export var playable_scene :PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Start"):
		_on_start_pressed()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(playable_scene)
