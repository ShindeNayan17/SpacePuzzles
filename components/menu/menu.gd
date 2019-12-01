
extends Node

#autoload singletons
# global


func _on_btn_new_game_pressed():
	global.new_game()

#func _on_btn_hi_scores_pressed():
#	global.load_hi_scores()
#
#func _on_btn_options_pressed():
#	global.load_options()

func _on_btn_quit_pressed():
	global.quit()
