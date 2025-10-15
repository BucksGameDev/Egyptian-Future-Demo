extends Area2D

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	animation_player.play("Fall")
	timer.start()
	
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
#get_tree().change_scene_to_file("res://Scenes/game2.tscn")
