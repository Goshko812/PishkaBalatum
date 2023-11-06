extends CharacterBody2D

@export var speed = 400
var bullet_scene = preload("res://Bullet.tscn")

func shoot():
	var bullet_instance = bullet_scene.instantiate()
	get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position # Set initial position in global coordinates
	bullet_instance.launch(Vector2(1, 0), 1000) # Set direction and speed as needed

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	get_input()
	move_and_slide()
