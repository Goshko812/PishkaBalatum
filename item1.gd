extends Area2D

var damage_bonus : int = 100

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		body.damagemod += 100
		#$"/root/GlobalScript".increase_bullet_damage(damage_bonus)
		queue_free()
