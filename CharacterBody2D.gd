extends CharacterBody2D

@export var speed = 400
@export var Bullet : PackedScene

func shoot():
	var b = Bullet
	add_child(b)

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	if Input.is_action_just_pressed("shoot"):
		shoot()
func _physics_process(delta):
	get_input()
	move_and_slide()
