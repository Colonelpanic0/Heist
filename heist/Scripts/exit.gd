extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body) -> void:
	if Singleton.gem_collected:
		Singleton._next_level()
