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
			drawShape(currentShape,currentPos,liveLayer)
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
	drawShape(currentShape,currentPos,liveLayer)
	drawShape(nextShape,nextPos,liveLayer)
	
func drawShape(shape,pos,layer):
	for cell in shape:
		if cell == Vector2i(1,1):
			$Main.set_cell(layer,cell+pos,0,Vector2i(1,0))
		else:
			$Main.set_cell(layer,cell+pos,0,Vector2i(0,0))
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
		drawShape(currentShape,currentPos,liveLayer)
	
	
	
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
		drawShape(currentShape,currentPos,liveLayer)
	else:
		landShape()
		checkRows()
		eraseShape(nextShape,nextPos)
		currentShapes = nextShapes
		nextShapes = pickShape()
		createShape()
func landShape():
	for k in currentShape:
		eraseShape(currentShape,currentPos)
		drawShape(currentShape,currentPos,deadLayer)
func checkRows():
	var row : int = 19
	while row > 0:
		var count = 0
		for k in range(10):
			if not isFree(Vector2i(k + 1, row)):
				count += 1
		#if row is full then erase it
		if count == 10:
			shiftRows(row)
	#		score += REWARD
	#		$HUD.get_node("ScoreLabel").text = "SCORE: " + str(score)
	#		speed += ACCEL
		else:
			row -= 1

func shiftRows(row):
	var atlas
	for k in range(row, 1, -1):
		for tt in range(9):
			atlas = $Main.get_cell_atlas_coords(deadLayer, Vector2i(tt + 1, k - 1))
			if atlas == Vector2i(-1, -1):
				$Main.erase_cell(deadLayer, Vector2i(tt + 1, k))
			else:
				$Main.set_cell(deadLayer, Vector2i(tt + 1, k), 0, atlas)

func clearBoard():
	for rowY in range(20):
		for rowX in range(10):
			$Main.erase_cell(deadLayer,Vector2i(rowX,rowY))

func checkGameOver():
	for cell in currentShape:
		if not isFree(cell + currentPos):
			landShape()
			gameRunning = false

func checkDown():
	
	
	
	pass
func _on_timer_timeout():
	moveDownAuto() # Replace with function body.
