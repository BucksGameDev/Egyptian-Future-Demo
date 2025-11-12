extends Label

@onready var counter: Label = $"."

var coins
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coins = 0
	counter.text = "coins: " + str(coins)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pickups_child_exiting_tree(node: Node) -> void:
	coins += 1
	counter.text = "coins: " + str(coins)
	
