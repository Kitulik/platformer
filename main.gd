extends Node

func _on_kill_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().reload_current_scene()


func _on_finish_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$UI/finish.show()


func _on_start_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$UI/start.hide()


func _on_fall_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$UI/fall.show()


func _on_fallend_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$UI/fall.hide()
		$UI/fallend.show()


func _on_falllie_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$UI/fallend.hide()
