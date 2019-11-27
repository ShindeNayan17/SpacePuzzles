extends "res://components/level_handler/levelAssets.gd"

#autoload singletons
# global

const blockWidth = 16;
const blockHeight = 16;
const blk = ["blank" ,0,"left"]; # type, length, direction (top, down, left, right)
const walL = ["wallSimple" ,1,"left"]; # type, length, direction (top, down, left, right)
const walL2 = ["wallSimple" ,1,"left"];
const walL3 = ["wallSimple" ,1,"left"];
const walL4 = ["wallSimple" ,1,"left"];
const brick = ["wallAnimated" ,1,"left"];
const spikeTop = ["Spikes" ,1,"top"];

const v = {
	0: blk,
	1: walL,
	2: walL2,
	3: walL3,
	4: walL4,
	5: brick,
	6: spikeTop
}

func addMovingEntities(level_node):
	pass;
func init_level(level_node):

	var vectorArray = [
	[v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6]],
	# offset , each backet 16px 
	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],	[],

	#[v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0], v[0]],
	#[v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6], v[6]],
	[]
	
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
					block.set_invert(false);
					pass;
				#block.set_color("#ff0000");
#				print("x, yoffset ", xOffset, yOffset );
				block.position = Vector2(xOffset, yOffset)
				#print("block pos", block.position, xOffset, yOffset);
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
