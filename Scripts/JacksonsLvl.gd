extends Node2D

var count
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $Label

func _count(coins) -> void:
	count += coins
	animation_player.play("coin pickup")
	if (count > 4):
		label.visible = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	count = 0
	label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
