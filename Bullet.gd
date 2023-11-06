extends Area2D    

# Variable for keeping track of its velocity        
var velocity: Vector2    

# Set the velocity of the bullet  
# Call this right after creating the bullet to make it start moving
func launch(direction: Vector2, speed: float):
	velocity = direction * speed

# This is automatically called every physics update.
func _physics_process(delta):  
	# Move the bullet using its previously defined velocity  
	position += velocity * delta

	# Check for collisions manually if needed
	# var collision = collide_and_get_normal(velocity)
	# if collision:
	#   # Handle collision here

	# For example, you might want to check if the bullet is out of bounds
	if position.x > 800 or position.x < 0 or position.y > 600 or position.y < 0:
		queue_free()
