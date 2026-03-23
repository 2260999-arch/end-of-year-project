extends CharacterBody2D


var SPEED = 300.0
var JUMP_VELOCITY = -200.0
var wall_jump_velo = -200.0
var gravity = 400.0
var jumping = false
var movable = true

func _physics_process(delta: float) -> void:
	if movable:
		
		# Add the gravity.
		if not is_on_floor():
			if is_on_wall_only() && !jumping:
				velocity.y += gravity/2 *delta
			else:
				velocity.y+=gravity*delta
		else:
			jumping = false
		var direction := Input.get_axis("Left", "Right")
		# Handle jump.a
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		if Input.is_action_just_pressed("Jump") and is_on_wall():
			jumping = true
			velocity.y = wall_jump_velo
			velocity.x = SPEED/2 * (direction*-1)
			await get_tree().create_timer(.5).timeout
			jumping = false

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.

		if direction && !jumping:
			velocity.x = direction * SPEED
		else:
			if !jumping:
				velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
