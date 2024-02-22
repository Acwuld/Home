extends Node2D

var currentShape:Array

var nextShapeIndex:int = 0
var nextType:int=0

var nextShape:Array
var gameRunning:bool
func _ready():
	gameRunning=true
func _process(_delta):
	var pos = Vector2i(0,0)
	currentShape = Global.shapes[nextShapeIndex][nextType]
	if gameRunning:
		if Input.is_action_just_released("anticlockwise"):
			eraseShape(currentShape,pos)
			nextType=(nextType+1)%4
			currentShape = Global.shapes[nextShapeIndex][nextType]
			drawShape(currentShape,pos)
		if Input.is_action_just_released("hold"):
			eraseShape(currentShape,pos)
			nextType = 0
			nextShapeIndex=(nextShapeIndex+1)%11
			currentShape = Global.shapes[nextShapeIndex][nextType]
			drawShape(currentShape,pos)
func drawShape(shape,pos):
	for cell in shape:
		if cell == Vector2i(1,1):
			$Squre.set_cell(0,cell+pos,0,Vector2i(1,0))
		else:
			$Squre.set_cell(0,cell+pos,0,Vector2i(0,0))
func eraseShape(shape,pos):
	for cell in shape:
		$Squre.erase_cell(0,cell+pos)
