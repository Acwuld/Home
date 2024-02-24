extends Node2D

@onready var main: TileMap = $Main
const deadLayer:int=0
const liveLayer:int=1


var currentShapes:Array
var currentShape:Array

var currentType:int=0
var directions:Array = [Vector2i.LEFT,Vector2i.RIGHT,Vector2.DOWN]
const initPos:Vector2i=Vector2i(5,-1)
var currentPos:Vector2i
const nextPos:Vector2i=Vector2i(20,-1)

var shapes:Array = Global.shapes
var shapesCopy:Array = shapes.duplicate()

var nextShapes:Array
var nextShape:Array

var heldShape:Array
var heldShapeIndex:int
const heldType:int=0

var gameRunning:bool
func _ready():
	gameRunning=true
	newGame()
	$Timer.start()
func _process(_delta):
	if gameRunning:
		if Input.is_action_just_released("anticlockwise"):
			eraseShape(currentShape,currentPos)
			rotateShape(true)
			drawShape(currentShape,currentPos)
		if Input.is_action_just_released("left"):
			moveShape(Vector2i.LEFT)
		if Input.is_action_just_released("right"):
			moveShape(Vector2i.RIGHT)
		#if Input.is_action_just_released("hold"):
			#eraseShape(currentShape,pos)
			#
			#nextShapeIndex=(nextShapeIndex+1)%11
			#currentShape = Global.shapes[nextShapeIndex][nextType]
			#drawShape(currentShape,pos)

func newGame():
	currentShapes = pickShape()
	nextShapes = pickShape()
	createShape()
	pass
func pauseGame():
	pass






func pickShape():
	var shape:Array
	if not shapesCopy.is_empty():
		shapesCopy.shuffle()
		shape = shapesCopy.pop_back()
	else:
		shapesCopy = shapes.duplicate()
		shapesCopy.shuffle()
		shape = shapesCopy.pop_back()
	return shape

func createShape():
	currentPos = initPos
	currentShape = currentShapes[0]
	nextShape = nextShapes[0]
	drawShape(currentShape,currentPos)
	drawShape(nextShape,nextPos)
	
func drawShape(shape,pos):
	for cell in shape:
		if cell == Vector2i(1,1):
			$Main.set_cell(liveLayer,cell+pos,0,Vector2i(1,0))
		else:
			$Main.set_cell(liveLayer,cell+pos,0,Vector2i(0,0))
func eraseShape(shape,pos):
	for cell in shape:
		$Main.erase_cell(liveLayer,cell+pos)
func rotateShape(direction:bool):
	if canRotate(direction):
		if direction:
			currentType=(currentType+1)%4
			currentShape = currentShapes[currentType]
		else:
			currentType=(currentType+3)%4
			currentShape = currentShapes[currentType]
func holdShape():
	pass
func moveShape(direction:Vector2i):
	if canMove(direction):
		eraseShape(currentShape,currentPos)
		currentPos+=direction
		drawShape(currentShape,currentPos)
	
	
	
func canMove(direction:Vector2i):
	var cm = true
	for cell in currentShape:
		if not isFree(cell + currentPos + direction):
			cm = false
	return cm
func canRotate(direction:bool):
	var cr = true
	var tempRotation:int = 0
	if direction:
		tempRotation = (currentType+1)%4
	else:
		tempRotation = (currentType+3)%4
	for cell in currentShapes[tempRotation]:
		if not isFree(cell + currentPos):
			cr = false
	return cr
func isFree(pos):
	return main.get_cell_source_id(deadLayer,pos)==-1

func moveDownAuto():
	if canMove(Vector2i.DOWN):
		eraseShape(currentShape,currentPos)
		currentPos+=Vector2i.DOWN
		drawShape(currentShape,currentPos)
	else:
		eraseShape(nextShape,nextPos)
		currentShapes = nextShapes
		nextShapes = pickShape()
		createShape()

	
func checkDown():
	
	
	
	pass
func _on_timer_timeout():
	moveDownAuto() # Replace with function body.
