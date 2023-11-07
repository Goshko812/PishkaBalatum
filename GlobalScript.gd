extends Node

signal increase_bullet_damage_signal

func increase_bullet_damage(bonus: int) -> void:
	emit_signal("increase_bullet_damage_signal", bonus)
