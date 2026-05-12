extends CharacterBody2D


var JUMP_VELOCITY = PlayerInfo.jump_velo
var wall_jump_velo = -300.0
var gravity = 400.0
var jumping = false
var bullet = preload("res://Scenes/test_bullet.tscn")
var dmg = PlayerInfo.equipped_items[0][2]
@onready var melee_hitbox: CollisionShape2D = $MeleeAttack/MeleeHitbox
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_time: Timer = $coyoteTime
@onready var inventory: Control = $Inventoryw
@onready var running_particles_l: GPUParticles2D = $AnimatedSprite2D/runningParticlesL
@onready var running_particles_r: GPUParticles2D = $AnimatedSprite2D/runningParticlesR


func _physics_process(delta: float) -> void:
	if animated_sprite_2d.scale.y<3.5:
		animated_sprite_2d.scale.y=abs(velocity.y/JUMP_VELOCITY)*0.2+1.5
	if animated_sprite_2d.scale.x>0.5:
		animated_sprite_2d.scale.x=abs(velocity.y/JUMP_VELOCITY)*-0.2+1.5
	if !jumping:
		velocity.x = 0
	if PlayerInfo.movable:
		
		# Add the gravity.
		if not is_on_floor():
			if is_on_wall_only() && !jumping:
				velocity.y += gravity/2 *delta
			else:
				velocity.y+=gravity*delta
			#if velocity.y > 400.0:
				#velocity.y = 400
		else:
			coyote_time.start()
			jumping = false
		var direction := Input.get_axis("Left", "Right")
		if direction == -1.0 or direction == 1.0:
			PlayerInfo.direction = direction
			if direction == -1.0:
				melee_hitbox.position.x = -15.5
			if direction == 1.0:
				melee_hitbox.position.x = 15.5
		# Handle jump.
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif Input.is_action_just_pressed("Jump") and coyote_time.time_left>0:
			velocity.y=JUMP_VELOCITY
			
		
		if Input.is_action_just_pressed("Jump") and is_on_wall():
			jumping = true
			velocity.y = wall_jump_velo
			velocity.x = PlayerInfo.speed * (direction*-1)
			await get_tree().create_timer(.2).timeout
			jumping = false

		if direction && !jumping:
			velocity.x = direction * PlayerInfo.speed
		else:
			if !jumping:
				velocity.x = move_toward(velocity.x, 0, PlayerInfo.speed)
	else:
		velocity.y = 0
		
	# handles animations
	if Engine.time_scale==1:
		if velocity.x!=0:
			animated_sprite_2d.play("run")
			if PlayerInfo.direction==1.0:
				animated_sprite_2d.flip_h=false
			if PlayerInfo.direction==-1.0:
				animated_sprite_2d.flip_h=true
		else:
			if is_on_floor():
				animated_sprite_2d.play("idle")
		if velocity.y<0:
			animated_sprite_2d.play("jump")
		else:
			if !is_on_floor():
				animated_sprite_2d.play("fall")
	move_and_slide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Inventory"):
		if !inventory.visible:
			inventory.visible = true
			Engine.time_scale=0.00000001
		else:
			inventory.visible = false
			Engine.time_scale=1
