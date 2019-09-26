extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SPEED = 100

const MIN_X = 100
const MAX_X = 380

var charge:=0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_left") && position.x>MIN_X:
		position.x-=SPEED*delta
		if position.x<MIN_X:
			position.x=MIN_X
	
	if Input.is_action_pressed("ui_right") && position.x<MAX_X:
		position.x+=SPEED*delta
		if position.x>MAX_X:
			position.x=MAX_X
			
	if Input.is_action_just_pressed("ui_accept") and $Timer.is_stopped():
		if charge>2:
			$BigLaser.visible=true
			$Timer.wait_time=2
		else:
			$Shield.setStatus(true)
		$Timer.start()

func _on_Timer_timeout():
	if $BigLaser.visible:
		$BigLaser.visible=false
		$Timer.wait_time=1
		charge=0
	else:
		$Shield.setStatus(false)

func _on_Area2D_area_entered(area):
	if area.is_in_group("AlienBall"):
		charge+=1
		area.queue_free()
	pass # Replace with function body.
