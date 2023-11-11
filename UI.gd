extends Control

@onready var player = preload("res://Player.gd")
@onready var level_label : Label = $Level
@onready var xp_label : Label = $XP

func _process(delta):
	update_ui()

func update_ui():
	level_label.text = "Level: " + str(player.level)
	xp_label.text = "XP: " + str(player.xp) + "/" + str(player.xp_to_level_up)
