extends CharacterBody2D

@export var speed = 400
@export var Bullet : PackedScene

func shoot():
	var bullet = Bullet.instance() # Load the bullet scene
	get_tree().root.add_child(bullet) # Add it to the scene tree
	bullet.position = self.position # Set its position (adjust as needed)


func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	if Input.is_action_just_pressed("shoot"):
		shoot()
func _physics_process(delta):
	get_input()
	move_and_slide()
