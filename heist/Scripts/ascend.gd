extends Area2D

var ascended :bool = false
var descended :bool = false

func _ready():
	ascended = false
	descended = false
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	print_debug("collide")
	if Singleton.gem_collected and !descended:
		body.position.y+=116
		descended=true
	elif !Singleton.gem_collected and !ascended:
		print_debug("ascend")
		body.position.y-=116
		ascended=true
