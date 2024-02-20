extends Node2D

var currentShape:Array

var nextShapeIndex:int = 1
var nextShape:Array
var gameRunning:bool
# Called when the node enters the scene tree for the first time.
func _ready():
	gameRunning=true
#	getNextShape()
	currentShape = Global.j0
	var pos = Vector2i(0,0)
	drawShape(currentShape,pos)
	
#	drawNextShape()

func _process(_delta):
	var pos = Vector2i(0,0)
	if gameRunning:
		if Input.is_action_pressed("anticlockwise"):
			eraseShape(currentShape,pos)
			drawShape(Global.j1,pos)
#func getNextShape():
#	randomize()
#	nextShapeIndex = randi_range(0,6)
#	nextShape = Global.shapes["shape"+str(nextShapeIndex)]

func drawShape(shape,pos):
	for cell in shape:
		$Squre.set_cell(0,cell+pos,0,Vector2i(0,0))
func eraseShape(shape,pos):
	for cell in shape:
		$Squre.erase_cell(0,cell+pos)
