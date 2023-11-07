extends CharacterBody2D

var health : int = 100 # You can adjust the initial health as needed

func drop_item():
	var item_instance = preload("res://item1.tscn").instantiate()
	get_parent().add_child(item_instance)
	item_instance.global_position = global_position

func die():
	drop_item()
	queue_free()

func take_damage(amount: int):
	health -= amount
	print("Enemy took", amount, "damage. Remaining health:", health)
	if health <= 0:
		call_deferred("die") #no idea why i use this i got this error - drop_item(): Can't change this state while flushing queries. Use call_deferred() or set_deferred() to change monitoring state instead.

# Movement speed
@export var speed = 100 
var player_position
var target_position
# Get a reference to the player. It's likely different in your project
@onready var player = get_parent().get_node("Player")

func _physics_process(delta):
	var speed: float = 0.01 # put wanted speed here
	#look_at(player.global_position)
	self.position = lerp(self.position,player.global_position,speed)
