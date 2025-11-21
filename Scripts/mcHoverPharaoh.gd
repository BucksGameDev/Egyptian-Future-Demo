extends CharacterBody2D

@onready var heart_0: AnimatedSprite2D = %Heart0
@onready var heart_1: AnimatedSprite2D = %Heart1
@onready var heart_2: AnimatedSprite2D = %Heart2
@onready var heart_3: AnimatedSprite2D = %Heart3
@onready var heart_4: AnimatedSprite2D = %Heart4
var health
@onready var texture_rect_1: TextureRect = %TextureRect1
@onready var texture_rect_2: TextureRect = %TextureRect2
@onready var texture_rect_3: TextureRect = %TextureRect3
@onready var texture_rect_4: TextureRect = %TextureRect4
@onready var texture_rect_5: TextureRect = %TextureRect5

var takingDamage

func _ready() -> void:
	takingDamage = false
	#animation_player.play("Sound")
	#texture_rect_1.custom_minimum_size = Vector2(40, 40)
	#texture_rect_2.custom_minimum_size = Vector2(40, 40)
	#texture_rect_3.custom_minimum_size = Vector2(40, 40)
	#texture_rect_4.custom_minimum_size = Vector2(40, 40)
	#texture_rect_5.custom_minimum_size = Vector2(40, 40)
	texture_rect_1.visible = true
	texture_rect_2.visible = true
	texture_rect_3.visible = true
	texture_rect_4.visible = true
	texture_rect_5.visible = true
	heart_0.visible = true
	heart_1.visible = true
	heart_2.visible = true
	heart_3.visible = true
	heart_4.visible = true
	heart_0.centered = false
	heart_1.centered = false
	heart_2.centered = false
	heart_3.centered = false
	heart_4.centered = false
	health = 5.0
	heart_0.play("Full")
	heart_1.play("Full")
	heart_2.play("Full")
	heart_3.play("Full")
	heart_4.play("Full")

@onready var timer: Timer = $Timer
@onready var timer_2: Timer = $Timer2

func _on_timer_timeout() -> void:
	takingDamage = false
	
func _on_timer_2_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/menuDied.tscn")

func _damage() -> void:
	if (health <= 1 && takingDamage == false):
		heart_0.play("Full-None")
		heart_1.play("None")
		heart_2.play("None")
		heart_3.play("None")
		heart_4.play("None")
		timer_2.start()
	elif (takingDamage == false):
		health -= 1
		takingDamage = true
		timer.start()
		if health == 4.5:
			pass
		elif health == 4:
			heart_0.play("Full")
			heart_1.play("Full")
			heart_2.play("Full")
			heart_3.play("Full")
			heart_4.play("Full-None")
		elif health == 3.5:
			pass
		elif health == 3:
			heart_0.play("Full")
			heart_1.play("Full")
			heart_2.play("Full")
			heart_3.play("Full-None")
			heart_4.play("None")
		elif health == 2.5:
			pass
		elif health == 2:
			heart_0.play("Full")
			heart_1.play("Full")
			heart_2.play("Full-None")
			heart_3.play("None")
			heart_4.play("None")
		elif health == 1.5:
			pass
		elif health == 1:
			heart_0.play("Full")
			heart_1.play("Full-None")
			heart_2.play("None")
			heart_3.play("None")
			heart_4.play("None")
			
		
		
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var JumpSound: AudioStreamPlayer2D = $JumpSound

@onready var MoveSounds: AudioStreamPlayer2D = $MoveSounds

func _input(event):
	# Keep only the one-shot Spacebar/Jump sound logic here
	if event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_SPACE:
			JumpSound.pitch_scale = 1.3
			JumpSound.volume_db = -10
			JumpSound.play()


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	#if 
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0 and is_on_floor():
		# Play the sound if the player is moving (direction != 0) AND the sound is not currently playing
		if not MoveSounds.playing:
			# Set the sound parameters for movement
			MoveSounds.pitch_scale = 0.9
			MoveSounds.volume_db = -11
			
			# NOTE: For continuous play, the sound file in your AudioStreamPlayer 
			# MUST have its "Loop" property enabled in the Inspector!
			MoveSounds.play()
	else:
		# Stop the sound if the player stops moving or jumps
		if MoveSounds.playing:
			MoveSounds.stop()
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.x == 0:
		animated_sprite_2d.play("Idle")
	if velocity.x < 0:
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("Move")
	elif velocity.x > 0:
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("Move")
	move_and_slide()


func _on_button_2_pressed() -> void:
	position.x -= 10
	
func _on_button_right_pressed() -> void:
	position.x += 10


func _on_button_up_pressed() -> void:
	position.y -= 20
