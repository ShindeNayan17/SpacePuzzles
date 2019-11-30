extends Node2D


const level_01_msg = "1. The Basics"; 
const level_02_msg = "2. More Spikes"; 
const level_03_msg = "3. Another way"; 
const level_04_msg = "4. The Basics"; 
const level_05_msg = "5. The Basics"; 

func _ready():
	
	if global.current_level == "01": 
		$mouse.show();
		$levelMessage.text = level_01_msg;
	else: $mouse.hide();
	if global.current_level == "02":
		$levelMessage.text = level_02_msg;
		 
	if global.current_level == "03":
		$levelMessage.text = level_03_msg;
		
	if global.current_level == "04":
		$levelMessage.text = level_04_msg;
	
	
	if global.current_level == "05":
		$levelMessage.text = level_05_msg;
		 
	pass