extends "res://components/level_handler/levelAssets.gd"

#autoload singletons
# global

const blockWidth = 64;
const blockHeight = 64;
const blk = ["blank" ,0,"left"]; # type, length, direction (top, down, left, right)
const wall = ["wallAnimated" ,1,"left"]; # type, length, direction (top, down, left, right)
const doorStartTop = ["doorVertical" ,2,"start", "top"];
const doorStartBottom = ["doorVertical" ,2,"start", "bottom"];
const doorEndTop = ["doorVertical",2, "end" ,"top"];
const doorEndBottom = ["doorVertical",2, "end" ,"bottom"];
const walL4 = ["wallSimple" ,1,"left"];
const brick = ["wallAnimated" ,1,"left"];
const spikeTop = ["Spikes" ,1,"bottom", true];
const portalStartL = ["Portal_p" ,1, "left"];
const portalEndL = ["Portal_g" ,1, "left"];
const portalStartR = ["Portal_p" ,1, "right"];
const portalEndR = ["Portal_g" ,1, "right"];


const v = {
	0: blk,
	1: wall,
	2: doorStartTop,
	3: doorStartBottom,
	4: doorEndTop,
	5: doorEndBottom,
	6: spikeTop,
	7: portalStartL,
	8: portalEndL,
	9: portalStartR,
	10: portalEndR
}

func addMovingEntities(level_node):
	var vectorArray = [
	[v[1], v[1], v[1], v[1], v[1], v[1], v[1], v[1], v[1], v[1]],
	[v[1], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[4], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[5], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[1], v[1], v[1], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[7], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[10], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[2], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[3], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[1], v[1], v[1], v[1], v[1], v[1], v[1], v[1], v[1]],
	
	]
	
	
	
	for i in range(vectorArray.size()):
		var aRow = vectorArray[i];
		for j in range(aRow.size()) :
			var aBlock = aRow[j];
			var xOffset = j*blockWidth;
			var yOffset = i*blockHeight;
			
			if aBlock[0] == "blank":
				pass;
			
			if aBlock[0] == "Portal_p":
				var block = portal_p.instance();
				var noOfBlocks = aBlock[1];
				var offset = block.getPositionOffset(aBlock[2]);
				block.position = Vector2(xOffset, yOffset) + offset;
				block.connect("portalEntered", level_node, "handleLevelEvents");
				level_node.connect("levelSignal", block, "_on_Portal_body_received");
				level_node.add_child(block);
				pass;
			
			if aBlock[0] == "Portal_g":
				var block = portal_g.instance();
				var noOfBlocks = aBlock[1];
				var offset = block.getPositionOffset(aBlock[2]);
				block.position = Vector2(xOffset, yOffset) + offset;
				block.connect("portalEntered", level_node, "handleLevelEvents");
				level_node.connect("levelSignal", block, "_on_Portal_body_received");
				level_node.add_child(block);
				pass;
		
		
#		

	pass;
func init_level(level_node):
	var vectorArray = [
	[v[1], v[1], v[1], v[1], v[1], v[1], v[1], v[1], v[1], v[1]],
	[v[1], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[4], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[5], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[1], v[1], v[1], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[2], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[3], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[1]],
	[v[1], v[1], v[1], v[1], v[1], v[1], v[1], v[1], v[1], v[1]],
	
	]
	
	
	
	for i in range(vectorArray.size()):
		var aRow = vectorArray[i];
		for j in range(aRow.size()) :
			var aBlock = aRow[j];
			var xOffset = j*blockWidth;
			var yOffset = i*blockHeight;
			
			if aBlock[0] == "blank":
				pass;
			if aBlock[0] == "wallSimple":
				var block = wallSimple.instance();
				var noOfBlocks = aBlock[1];
				block.set_width(blockWidth);
				block.set_length(blockHeight * noOfBlocks);
				block.set_color("#ff0000");
#				print("x, yoffset ", xOffset, yOffset );
				block.position = Vector2(xOffset, yOffset)
				#print("block pos", block.position, xOffset, yOffset);
				level_node.add_child(block);
				pass;
			if aBlock[0] == "doorVertical":
				var block = doorVertical.instance();
				var noOfBlocks = aBlock[1];
				var doorAction = aBlock[2];
				var doorPart = aBlock[3];
				print("doorPart", doorPart);
				block.set_doorParts(doorPart);
				block.set_doorAction(doorAction);
				#var blockNode = block.get_node("DoorVertical");
				#blockNode.connect
				block.position = Vector2(xOffset, yOffset);
				block.set_enableEvents(true);
				block.connect("doorEntered", level_node, "handleLevelEvents");
				level_node.connect("doorEntered", block, "_on_Portal_body_received");
				level_node.add_child(block);
				
				
				
				
				
			if aBlock[0] == "wallAnimated":
				var block = wallAnimated.instance();
				var noOfBlocks = aBlock[1];
				block.set_width(blockWidth);
				block.set_length(blockHeight * noOfBlocks);
				#block.set_color("#ff0000");
#				print("x, yoffset ", xOffset, yOffset );
				block.position = Vector2(xOffset, yOffset)
				#print("block pos", block.position, xOffset, yOffset);
				level_node.add_child(block);
				pass;
			if aBlock[0] == "Spikes":
				var block = spikes.instance();
				var noOfBlocks = aBlock[1];
				block.set_width(blockWidth);
				block.set_length(blockHeight * noOfBlocks);
				var direction = aBlock[2];
				if direction == "top":
					block.set_orientation("horizontal");
					
					pass;
				var isInvert = aBlock[3];
				block.set_invert(isInvert);
				#block.set_color("#ff0000");
#				print("x, yoffset ", xOffset, yOffset );
				block.position = Vector2(xOffset, yOffset)
				#print("block pos", block.position, xOffset, yOffset);
				level_node.add_child(block);
				pass;
			
			if aBlock[0] == "Portal_p":
				var block = portal_p.instance();
				var noOfBlocks = aBlock[1];
				var offset = block.getPositionOffset("left");
				block.position = Vector2(xOffset, yOffset) + offset;
				level_node.add_child(block);
				pass;
			
			if aBlock[0] == "Portal_g":
				var block = portal_g.instance();
				var noOfBlocks = aBlock[1];
				var offset = block.getPositionOffset("right");
				block.position = Vector2(xOffset, yOffset) + offset;
				level_node.add_child(block);
				pass;
		
		
	self.addMovingEntities(level_node);
#		


#	var brick_array = { #FOR TESTS
#		0:[0,0,0,0,0,0,0,0,0,0,0],
#		1:[0,0,0,0,0,0,0,0,0,0,0],
#		2:[0,0,0,0,0,0,0,0,0,0,0],
#		3:[0,0,0,0,0,0,0,0,0,0,0],
#		4:[0,0,0,0,0,0,0,0,0,0,0],
#		5:[0,0,0,0,0,0,0,0,0,0,0],
#		6:[0,0,0,0,0,0,0,0,0,0,0],
#		7:[1,1,1,1,1,1,1,1,1,1,1]
#	}
		
	
#	var bricks_in_row = floor(1024/(global.BRICK_WIDTH))
#	var margin = (1024-(global.BRICK_WIDTH)*bricks_in_row)/2
#	var top = 100
#	var total_bricks=0
#	for i in range(8):
#		var brick_line = brick_array[i]
#		for j in range(bricks_in_row):
#			if(brick_line[j]>0):
#				#var b = brick.instance()
#				var b = {};
#				b.name = "brick_"+str(i)+"_"+str(j)
#				b.position = Vector2(j*(global.BRICK_WIDTH)+margin+global.BRICK_WIDTH/2,top+i*(global.BRICK_HEIGHT))
#				b.set_meta("type","brick")
#				b.set_hp(brick_line[j])
#				level_node.add_child(b)
#				total_bricks += 1
#
#	return total_bricks
func handleEvents(level_node, type, params):
	print(level_node,level_node.name, level_node, type, params);
	if type == "Portal_g":
		
		level_node.emit_signal("levelSignal", "Portal_p", params);
	if type == "doorVertical":
		var action = params;
		if action == "start":
			print("exec level start");
			#do nothing
#			print("exec start");
			pass;
		if action == "end":
			print("exec level end");
			level_node.level_complete();
			pass;
		