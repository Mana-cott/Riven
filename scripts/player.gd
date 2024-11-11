extends CharacterBody2D


const SPEED = 50.0

var last_movement_animation_played = "move_down"
@onready var animator: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):

	# Overworld movement
	var direction = Vector2()
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
	velocity = direction * SPEED
	
	# Animation handling
	match direction:
		Vector2(0, 0):
			match last_movement_animation_played:
				"move_up":
					animator.play("idle_up")
				"move_down":
					animator.play("idle_down")
				"move_left":
					animator.play("idle_left")
				"move_right":
					animator.play("idle_right")
				"move_left_down":
					animator.play("idle_left_down")
				"move_left_up":
					animator.play("idle_left_up")
				"move_right_down":
					animator.play("idle_right_down")
				"move_right_up":
					animator.play("idle_right_up")
		Vector2(0, -1):
			animator.play("move_up")
			last_movement_animation_played = "move_up"
		Vector2(0, 1):
			animator.play("move_down")
			last_movement_animation_played = "move_down"
		Vector2(-1, 0):
			animator.play("move_left")
			last_movement_animation_played = "move_left"
		Vector2(1, 0):
			animator.play("move_right")
			last_movement_animation_played = "move_right"
		Vector2(-1, -1):
			animator.play("move_left_up")
			last_movement_animation_played = "move_left_up"
		Vector2(1, -1):
			animator.play("move_right_up")
			last_movement_animation_played = "move_right_up"
		Vector2(-1, 1):
			animator.play("move_left_down")
			last_movement_animation_played = "move_left_down"
		Vector2(1, 1):
			animator.play("move_right_down")
			last_movement_animation_played = "move_right_down"
	
	move_and_slide()
