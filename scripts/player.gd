extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -350.0
var can_double_jump := false
var jumps_left := 2

const MAX_JUMPS = 2

var jumps_remaining := MAX_JUMPS

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var character_body_2d: CharacterBody2D = $"."

func die():
	animated_sprite_2d.play("hit")
	set_physics_process(false)  # Disable player movement

func jump_player():
	animated_sprite_2d.play("jump")

func double_jump_player():
	animated_sprite_2d.play("double_jump")

func _physics_process(delta: float) -> void:
	print()

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		jumps_remaining = MAX_JUMPS

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jumps_remaining > 0:
		velocity.y = JUMP_VELOCITY
		jumps_remaining -= 1

		# Play appropriate jump animation
		if jumps_remaining == MAX_JUMPS - 1:  # First jump
			jump_player()
		else:  # Double jump
			double_jump_player()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")

	# Add animation of idle/movement:
	if direction == 0:
		animated_sprite_2d.play("idle")
	else:
		if is_on_floor():
			animated_sprite_2d.play("run")

	# Change Sprite Direction
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif  direction < 0:
		animated_sprite_2d.flip_h = true

	# Apply the movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
