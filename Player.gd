extends CharacterBody2D

@export var speed = 400
var bullet_scene = preload("res://Bullet.tscn")

func shoot(direction: Vector2):
	var bullet_instance = bullet_scene.instantiate()
	get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position
	bullet_instance.launch(direction, 1000) # Set a suitable speed

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed

	# Pass the direction to the shoot() function only if there is movement
	if input_direction != Vector2.ZERO and Input.is_action_just_pressed("shoot"):
		shoot(input_direction)

func _physics_process(delta):
	#Clamp the position to stay within a 4000x4000 area
	position.x = clamp(position.x, 0, 4000)
	position.y = clamp(position.y, 0, 4000)
	get_input()
	move_and_slide()
