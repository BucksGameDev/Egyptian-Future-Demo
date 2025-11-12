extends Node2D

var count
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _count(coins) -> void:
	count += coins
	animation_player.play("pickup sound")
	if (count > 4):
		get_tree().change_scene_to_file("res://Scenes/Person3-Scene.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	count = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
