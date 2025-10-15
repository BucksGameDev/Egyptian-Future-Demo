extends CharacterBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

#func _ready() -> void:
	#animation_player.play("Sound")
	
@onready var timer: Timer = $Timer

	
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	#if 
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation_player.play("Sound")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.x == 0:
		animated_sprite_2d.play("Idle")
	if velocity.x < 0:
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("Move")
		animation_player.play("Sound")
	elif velocity.x > 0:
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("Move")
		animation_player.play("Sound")
	move_and_slide()


func _on_button_2_pressed() -> void:
	position.x -= 10
	
func _on_button_right_pressed() -> void:
	position.x += 10


func _on_button_up_pressed() -> void:
	position.y -= 20
