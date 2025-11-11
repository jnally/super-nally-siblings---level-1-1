extends CanvasLayer

func _on_start_pressed() -> void:
	Global.player_lives = 3
	Global.total_coins = 0
	get_tree().change_scene_to_file("res://world.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
