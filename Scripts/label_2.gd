extends Label
@onready var label_2: Label = $"."


	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_2.visible = false
