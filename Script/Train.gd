extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SPEED = 2

const MIN_X = 45
const MAX_X = 435

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_left") && position.x>MIN_X:
		position.x-=SPEED
		if position.x<MIN_X:
			position.x=MIN_X
	
	if Input.is_action_pressed("ui_right") && position.x<MAX_X:
		position.x+=SPEED
		if position.x>MAX_X:
			position.x=MAX_X
	
#	pass
