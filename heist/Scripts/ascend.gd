extends Area2D

var ascended :bool = false
var descended :bool = false

func _ready():
	
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if Singleton.gem_collected and !descended:
		body.position.y-=116
		descended=true
	elif !Singleton.gem_collected and !ascended:
		body.position.y+=116
		ascended=true
	
	queue_free() 
