extends Node2D

@onready var main: TileMap = $Main
@onready var held: TileMap = $Held
@onready var next: TileMap = $Next

var currentShape:Array
var currentShapeIndex:int
var currentType:int=0
var initPos:Vector2i=Vector2i(5,-1)
var currentPos

var shapes:Array = [0,1,2,3,4,5,6,7,8,9,10]
var shapesCopy:Array = [0,1,2,3,4,5,6,7,8,9,10]

var nextShape:Array
var nextShapeIndex:int = 0
const nextType:int=0

var heldShape:Array
var heldShapeIndex:int
const heldType:int=0

var gameRunning:bool
func _ready():
	gameRunning=true
	currentShapeIndex=pickShape()
	
	$Timer.start()
func _process(_delta):
	
	showNext()
	currentShape = Global.shapes[currentShapeIndex][currentType]
	if gameRunning:
		if Input.is_action_just_released("anticlockwise"):
			eraseShape(main,currentShape,currentPos)
			rotateShape(true)
			drawShape(main,currentShape,currentPos)
		if Input.is_action_just_released("left"):
			moveHorizontal(true)
		if Input.is_action_just_released("right"):
			moveHorizontal(false)
		#if Input.is_action_just_released("hold"):
			#eraseShape(currentShape,pos)
			#
			#nextShapeIndex=(nextShapeIndex+1)%11
			#currentShape = Global.shapes[nextShapeIndex][nextType]
			#drawShape(currentShape,pos)
func pickShape():
	currentPos = initPos
	var shape=0
	if not shapesCopy.is_empty():
		shapesCopy.shuffle()
		print(shapesCopy)
		shape = shapesCopy.pop_back()
		print(shapesCopy)
	else:
		shapesCopy = shapes.duplicate()
		shapesCopy.shuffle()
		shape = shapesCopy.pop_back()
	return shape
func drawShape(tile,shape,pos):
	for cell in shape:
		if cell == Vector2i(1,1):
			tile.set_cell(0,cell+pos,0,Vector2i(1,0))
		else:
			tile.set_cell(0,cell+pos,0,Vector2i(0,0))
func eraseShape(tile,shape,pos):
	for cell in shape:
		tile.erase_cell(0,cell+pos)
func rotateShape(direction:bool):
	if direction:
		currentType=(currentType+1)%4
		currentShape = Global.shapes[currentShapeIndex][currentType]
	else:
		currentType=(currentType+3)%4
		currentShape = Global.shapes[currentShapeIndex][currentType]
func holdShape():
	pass
func moveShape():
	pass
func showNext():
	nextShapeIndex = shapesCopy[-1]
	drawShape(next,Global.shapes[nextShapeIndex][0],Vector2i(0,0))
	pass
func moveDownAuto():
	eraseShape(main,currentShape,currentPos)
	currentPos+=Vector2i.DOWN
	drawShape(main,currentShape,currentPos)
func moveHorizontal(direction:bool):
	eraseShape(main,currentShape,currentPos)
	if direction:
		currentPos+=Vector2i.LEFT
	else:
		currentPos+=Vector2i.RIGHT
	drawShape(main,currentShape,currentPos)
	
func checkDown():
	
	
	
	pass
func _on_timer_timeout():
	moveDownAuto() # Replace with function body.
