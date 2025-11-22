extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("Death")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menuLVL.tscn")


func _on_options_pressed() -> void:
	pass


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Credits.tscn")
	






func _on_quit_pressed() -> void:
	get_tree().quit()
