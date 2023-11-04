extends CharacterBody2D

# Movement speed
@export var speed = 100 
var player_position
var target_position
# Get a reference to the player. It's likely different in your project
@onready var player = get_parent().get_node("Player")

func _physics_process(delta):
	var speed: float = 0.01 # put wanted speed here
	look_at(player.global_position)
	self.position = lerp(self.position,player.global_position,speed)