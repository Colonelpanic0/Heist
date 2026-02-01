extends Control

@onready var time_label :Label = $Time
@onready var score_label :Label = $Lives
@onready var lives_label :Label = $Score

func _process(delta: float) -> void:
	time_label.text = "Time: " + str(Singleton.timer)
	lives_label.text = "Lives: " + str(Singleton.lives)
	score_label.text = "Score: " + str(Singleton.score)
