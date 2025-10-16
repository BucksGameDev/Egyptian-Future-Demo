extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
func _ready() -> void:
	animated_sprite_2d.visible = true


func _on_body_entered(body: Node2D) -> void:
	animated_sprite_2d.visible = false
	animation_player.play("Pickup")
	timer.start()
	


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/game2.tscn")
