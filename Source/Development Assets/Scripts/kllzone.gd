extends Area2D

@onready var timer = $Timer
@onready var death_scene = $ColorRect2


func _on_body_entered(body):
	Engine.time_scale = 0.5
		
	body.get_node("CollisionShape2D").queue_free()
	
	death_scene.color = Color(1, 0, 0, 0.176)
	
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
