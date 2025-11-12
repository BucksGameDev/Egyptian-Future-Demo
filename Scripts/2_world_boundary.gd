extends Area2D

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	#plays hawk sound
	animation_player.play("HawkCry")
	timer.start()
	
	
func _on_timer_timeout() -> void:
	#reloads level
	get_tree().reload_current_scene()
