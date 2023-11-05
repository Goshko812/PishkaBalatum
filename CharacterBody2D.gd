extends CharacterBody2D

@export var speed = 400
##@export var Bullet : PackedScene
var bullet_scene = preload("res://Bullet.tscn")
func shoot():
	var bullet_instance = bullet_scene.instantiate()
	add_child(bullet_instance)
	bullet_instance.position = self.position # Set initial position
	#bullet_instance.direction = Vector2(1, 0)  # Set initial direction


func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	if Input.is_action_just_pressed("shoot"):
		shoot()
func _physics_process(delta):
	get_input()
	move_and_slide()
