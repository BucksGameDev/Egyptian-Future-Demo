extends Control

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_lvl_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Person1-Scene.tscn")


func _on_lvl_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Person2-Scene.tscn")


func _on_lvl_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Person3-Scene.tscn")
