extends Area2D
@onready var timer_2: Timer = $Timer2

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var player
@onready var falling_soundtrack: AnimationPlayer = $"Falling Soundtrack"
var isFalling

func _ready() -> void:
	isFalling = false
	player = get_tree().current_scene.get_node("EgyptianGuy")

func _on_body_entered(_body: Node2D) -> void:
	#plays hawk sounds
	falling_soundtrack.play("Falling")
	timer.start()
	
	
	
func _on_timer_timeout() -> void:
	if not isFalling:
		player._damage()
		timer_2.start()
		player.global_position = Vector2(-519, -1121)
		

	#reloads level
	#get_tree().reload_current_scene()


func _on_timer_2_timeout() -> void:
	isFalling = false
