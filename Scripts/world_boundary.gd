extends Area2D
@onready var timer_2: Timer = $Timer2

@onready var timer: Timer = $Timer
var player
var falling
func _ready() -> void:
	falling = false
	player = get_tree().current_scene.get_node("EgyptianGuy")
@onready var falling_soundtrack: AnimationPlayer = $"Falling Soundtrack"

func _on_body_entered(_body: Node2D) -> void:
	#plays hawk sounds
	falling_soundtrack.play("Falling")
	timer.start()
	
func _on_timer_timeout() -> void:
	#reloads level
	if (falling == false):
		falling = true
		player._damage()
		player.global_position = Vector2(-185, -260)
		timer_2.start()


func _on_timer_2_timeout() -> void:
	falling = false
