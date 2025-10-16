extends Area2D

@onready var timer: Timer = $Timer
@onready var falling_soundtrack: AnimationPlayer = $"Falling Soundtrack"

func _on_body_entered(body: Node2D) -> void:
	falling_soundtrack.play("Falling")
	timer.start()
	
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
#get_tree().change_scene_to_file("res://Scenes/game2.tscn")
