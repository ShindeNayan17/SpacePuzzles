extends Area2D

var color = "blue";
var hasCollided = false;

func _ready():
	setEffects();
	pass;
func updateGem():
	$gemBlue.hide();
	$gemGreen.hide();
	$gemRed.hide();
	$gemYellow.hide();
	
	if color == "blue":
		$gemBlue.show();
		pass
	if color == "green":
		$gemGreen.show();
	if color == "red":
		$gemRed.show();
	if color == "yellow":
		$gemYellow.show();
	update();
	


func set_color(newColor: String):
	color = newColor;
	updateGem();
#


func collide(entity):
	if (!hasCollided):
		$shape.disabled = true;
		hasCollided = true;
		var gemScore = 1;
		if color == "blue":
			gemScore = 5;
		if color == "green":
			gemScore = 10;
		if color == "red":
			gemScore = 50;
		if color == "yellow":
			gemScore = 100;
		global.score += gemScore;
		showEffect();
#		yield(create_timer(0.25), "timeout")
		
	pass;
#

func showEffect():
	
	
	$effect.start();
func setEffects():
	$effect.interpolate_property(self, 'scale',
        self.scale, Vector2(2.0, 2.0), 0.3,
        Tween.TRANS_QUAD, Tween.EASE_OUT)
	var currentmodulate = self.modulate;
	currentmodulate = currentmodulate.lightened(255)
	$effect.interpolate_property(self, 'modulate',
        modulate, Color(0,0,0,0), 0.3,
        Tween.TRANS_QUAD, Tween.EASE_OUT)
	

func create_timer(wait_time):
	var timer = Timer.new()
	timer.set_wait_time(wait_time)
	timer.set_one_shot(true)
	timer.connect("timeout", timer, "queue_free")
	add_child(timer)
	timer.start()
	return timer
	pass

	

func _on_Gems_body_entered(body):
	if (global.level_pause): return;
	if (body.name == "Player" ):
		collide(body);	

func _on_effect_tween_completed(object, key):
	queue_free();
	pass # Replace with function body.
