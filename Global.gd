extends Node

#shape:I,J,L,O,S,T,Z
var A:=[[Vector2i(1,1)],
		[Vector2i(1,1)],
		[Vector2i(1,1)],
		[Vector2i(1,1)]]
var B:=[[Vector2i(1,1),Vector2i(1,0)],
		[Vector2i(1,1),Vector2i(0,1)],
		[Vector2i(1,1),Vector2i(1,2)],
		[Vector2i(1,1),Vector2i(2,1)]]
var C:=[[Vector2i(1,0),Vector2i(1,1),Vector2i(1,2)],
		[Vector2i(0,1),Vector2i(1,1),Vector2i(2,1)],
		[Vector2i(1,0),Vector2i(1,1),Vector2i(1,2)],
		[Vector2i(0,1),Vector2i(1,1),Vector2i(2,1)],]
var D:=[[Vector2i(1,0),Vector2i(1,1),Vector2i(2,1)],
		[Vector2i(0,1),Vector2i(1,1),Vector2i(1,0)],
		[Vector2i(0,1),Vector2i(1,1),Vector2i(1,2)],
		[Vector2i(1,2),Vector2i(1,1),Vector2i(2,1)]]
# I
var I:=[[Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(1,3)],
		[Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(3,1)],
		[Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(1,-1)],
		[Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(-1,1)]]
var J:=[[Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(0,2)],
		[Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(2,2)],
		[Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(2,0)],
		[Vector2i(0,0), Vector2i(0,1), Vector2i(1,1), Vector2i(2,1)]]
var L:=[[Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(2,2)],
		[Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(2,0)],
		[Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(0,0)],
		[Vector2i(0,2), Vector2i(0,1), Vector2i(1,1), Vector2i(2,1)]]
var O:=[[Vector2i(0,0), Vector2i(0,1), Vector2i(1,0), Vector2i(1,1)],
		[Vector2i(0,2), Vector2i(0,1), Vector2i(1,1), Vector2i(1,2)],
		[Vector2i(2,2), Vector2i(1,1), Vector2i(1,2), Vector2i(2,1)],
		[Vector2i(2,0), Vector2i(2,1), Vector2i(1,0), Vector2i(1,1)]]
var S:=[[Vector2i(1,0), Vector2i(2,0), Vector2i(0,1), Vector2i(1,1)],
		[Vector2i(0,0), Vector2i(0,1), Vector2i(1,2), Vector2i(1,1)],
		[Vector2i(1,1), Vector2i(2,1), Vector2i(0,2), Vector2i(1,2)],
		[Vector2i(1,0), Vector2i(1,1), Vector2i(2,2), Vector2i(2,1)]]
var T:=[[Vector2i(0,1), Vector2i(1,1), Vector2i(2,1), Vector2i(1,2)],
		[Vector2i(1,0), Vector2i(1,1), Vector2i(1,2), Vector2i(2,1)],
		[Vector2i(1,0), Vector2i(0,1), Vector2i(1,1), Vector2i(2,1)],
		[Vector2i(1,0), Vector2i(0,1), Vector2i(1,1), Vector2i(1,2)]]
var Z:=[[Vector2i(0,0), Vector2i(1,0), Vector2i(1,1), Vector2i(2,1)],
		[Vector2i(1,0), Vector2i(1,1), Vector2i(0,1), Vector2i(0,2)],
		[Vector2i(0,1), Vector2i(1,1), Vector2i(1,2), Vector2i(2,2)],
		[Vector2i(2,0), Vector2i(2,1), Vector2i(1,1), Vector2i(1,2)]]
var shapes := [A,B,C,D,I,J,L,O,S,T,Z]
