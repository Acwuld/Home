extends Node2D

var nextShapeIndex:int = 1
var nextShape:Array

# Called when the node enters the scene tree for the first time.
func _ready():
	getNextShape()
#	drawNextShape()

func _process(_delta):
	pass
func getNextShape():
	randomize()
	nextShapeIndex = randi_range(0,6)
	nextShape = Global.shapes["shape"+str(nextShapeIndex)]

#func drawNextShape():
#	for cell in nextShape:
#		$Squre.set_cell(0,cell,-1)
