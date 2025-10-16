extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var label_2: Label = $"../../Label2"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
func _ready() -> void:
	animated_sprite_2d.visible = true


func _on_body_entered(body: Node2D) -> void:
	animated_sprite_2d.visible = false
	label_2.visible = true
	animation_player.play("Pickup")
	
