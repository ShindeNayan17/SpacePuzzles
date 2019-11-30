extends Node

var score # score of the current game
var brick_texture #array of brick textures 
var bonus_texture #dictionary of bonus textures
var bonus_effect #dictionary of bonus effects
var bonus_message #dictionary of bonus messages 
const PLAYER_DEFAULT_LIVES = 5;

var player_init_position = Vector2(100,760);
const TOTAL_LEVEL = "03"

var current_level = "02";

var level_pause = false;
#constants
const BRICK_WIDTH = 86
const BRICK_HEIGHT = 37
const INITIAL_PADDLE_WIDTH = 100
const PADDLE_HEIGHT=15
const MAX_LEVEL = 2




func _ready():
	pass

func new_game():
	get_tree().change_scene("res://mainGameScreen/MainGameScreen.tscn")

func load_menu():
	get_tree().change_scene("res://menu/menu.tscn")
	
func load_hi_scores():
	get_tree().change_scene("res://hi_scores/hi_scores.tscn")

func load_options():
	get_tree().change_scene("res://options/options.tscn")

func load_game_over(score):
	get_tree().change_scene("res://game_over/game_over.tscn")
	
func quit():
	get_tree().quit()


func getNextLevel():
	var currentLevel = global.current_level;
	var currentLevelNo = int(currentLevel);
	var total = int(TOTAL_LEVEL);
	if currentLevelNo < total :
		currentLevelNo += 1;
		currentLevel = "0" + str(currentLevelNo);
	else: pass;
	return currentLevel;