extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_layer_z_index(1,-2)
	set_layer_z_index(2,-3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("entered!!")
	set_layer_z_index(2, -1)
