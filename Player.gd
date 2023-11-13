extends CharacterBody2D

@export var speed = 400
@export var damagemod = 0
var bullet_scene = preload("res://Bullet.tscn")

###
var xp : int = 0
var level : int = 1
var xp_to_level_up : int = 100
# Function to gain XP
func gain_xp(amount: int):
	xp += amount
	check_level_up()
	print("XP is now , ",xp)
# Function to check if the player should level up
func check_level_up():
	if xp >= xp_to_level_up:
		xp -= xp_to_level_up
		level_up()
# Function to handle level up
func level_up():
	level += 1
	xp_to_level_up = calculate_next_level_xp()
	var item_instance = preload("res://item1.tscn").instantiate()
	get_parent().add_child(item_instance)
	item_instance.global_position = global_position
	print("new level up current level is , ",level)
# Add additional logic for stat increases, new abilities, etc.
# Function to calculate XP required for the next level
func calculate_next_level_xp() -> int:
	return level * 100
###

func shoot(direction: Vector2):
	var bullet_instance = bullet_scene.instantiate()
	get_parent().add_child(bullet_instance)
	bullet_instance.global_position = global_position
	bullet_instance.launch(direction, 1000, damagemod) # Set a suitable speed

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
