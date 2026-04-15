extends CharacterBody2D


var JUMP_VELOCITY = PlayerInfo.jump_velo
var wall_jump_velo = -200.0
var gravity = 400.0
var jumping = false
var bullet = preload("res://Scenes/test_bullet.tscn")
@onready var inventory: Control = $Inventory


func _physics_process(delta: float) -> void:
	velocity.x = 0
	if PlayerInfo.movable:
		
		# Add the gravity.
		if not is_on_floor():
			if is_on_wall_only() && !jumping:
				velocity.y += gravity/2 *delta
			else:
				velocity.y+=gravity*delta
			if velocity.y > 400.0:
				velocity.y = 400
		else:
			jumping = false
		var direction := Input.get_axis("Left", "Right")
		if direction == -1.0 or direction == 1.0:
			PlayerInfo.direction = direction
		# Handle jump.
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		if Input.is_action_just_pressed("Jump") and is_on_wall():
			jumping = true
			velocity.y = wall_jump_velo
			velocity.x = PlayerInfo.speed/2 * (direction*-1)
			await get_tree().create_timer(.5).timeout
			jumping = false

		if direction && !jumping:
			velocity.x = direction * PlayerInfo.speed
		else:
			if !jumping:
				velocity.x = move_toward(velocity.x, 0, PlayerInfo.speed)
	else:
		velocity.y = 0
	move_and_slide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Inventory") && is_on_floor():
		if !inventory.visible:
			inventory.visible = true
			PlayerInfo.movable = false
		else:
			inventory.visible = false
			PlayerInfo.movable = true
