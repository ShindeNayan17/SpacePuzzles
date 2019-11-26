extends "res://components/level_handler/levelAssets.gd"

#autoload singletons
# global

const blockWidth = 16;
const blockHeight = 16;
const blk = ["blank" ,0,"left"]; # type, length, direction (top, down, left, right)
const walL = ["wallSimple" ,10,"left"]; # type, length, direction (top, down, left, right)
const walL2 = ["wallSimple" ,15,"left"];
const walL3 = ["wallSimple" ,20,"left"];
const walL4 = ["wallSimple" ,25,"left"];
const brick = ["wallAnimated" ,25,"left"];

func init_level(level_node):

	var vectorArray = {
		0:[blk, blk, blk, blk, blk, blk, blk, blk],
		1:[blk, blk, blk, blk, blk, blk, blk, blk],
		2:[blk, blk, blk, blk, blk, blk, blk, blk],
		3:[blk, blk, blk, brick, blk, blk, blk, blk],
		4:[blk, blk, blk, blk, blk, blk, blk, blk],
		5:[blk, blk, blk, blk, blk, blk, blk, blk],
		6:[blk, blk, blk, blk, blk, blk, blk, blk],
		7:[walL, walL2, walL3, walL4, walL, walL2, walL3, walL4]
	}
	
	for i in range(8):
		var aRow = vectorArray[i];
		for j in range(aRow.size()) :
			var aBlock = aRow[j];
			var xOffset = j*blockWidth *2;
			var yOffset = i*blockHeight*2;
			
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
