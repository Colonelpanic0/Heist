extends Area2D

var active :bool

func _ready() -> void:
	active = false
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exit)

func _process(delta: float) -> void:
	if active:
		if Input.is_action_pressed("Up") and Singleton.hidden == false:
			Singleton.hidden = true
			
		if Input.is_action_pressed("Down") or Input.is_action_pressed("Left") or Input.is_action_pressed("Right") or Input.is_action_pressed("Jump"):
			Singleton.hidden = false
			

func _on_body_entered(body) -> void:
	print_debug("enter")
	active = true

func _on_body_exit(body) -> void:
	print_debug("exit")
	active = false
