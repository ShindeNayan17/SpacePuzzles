extends Node2D
signal toggleLoadingScreen;
func _ready():
	pass
func toggle(flag):
	if flag:
		self.show();
	else:
		self.hide();
	return ;