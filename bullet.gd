extends Area2D

var speed = 1000 # Adjust this value to control bullet speed

func _process(delta):
	translate(Vector2(speed * delta, 0)) # Adjust direction if needed
	if position.x > get_viewport_rect().size.x:
		queue_free() # Destroy the bullet when it leaves the screen
