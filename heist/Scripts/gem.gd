extends Area2D 

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body): 
	Singleton.alarmed = true
	Singleton.gem_collected = true
	
	queue_free() 
