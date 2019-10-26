extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var sound_shield = preload("res://Sound/sfx_sound_mechanicalnoise4.wav")
var sound_laser = preload("res://Sound/sfx_sound_shutdown1.wav")

signal catch_ball

const SPEED = 200

const MIN_X = 100
const MAX_X = 380

const COOLDOWN_SHIELD = 0.5
const COOLDOWN_LASER = 0.6

var charge:=0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setStatus(m_node, b):
	m_node.visible=b
	m_node.monitoring=b
	m_node.monitorable=b

func setStatusLaser(b):
	setStatus($BigLaser, b);

func setStatusShield(b):
	setStatus($Shield, b);

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
			setStatusLaser(true)
			$AudioStreamPlayer.set_stream(sound_laser)
			$Timer.wait_time=COOLDOWN_LASER
		else:
			setStatusShield(true)
			$AudioStreamPlayer.set_stream(sound_shield)
		$AudioStreamPlayer.play()
		$Timer.start()

func _on_Timer_timeout():
	if $BigLaser.visible:
		setStatusLaser(false)
		$Timer.wait_time=COOLDOWN_SHIELD
		charge=0
	else:
		setStatusShield(false)

func _on_Area2D_area_entered(area):
	if area.is_in_group("AlienBall"):
		charge+=1
		area.queue_free()
		emit_signal("catch_ball")
	pass # Replace with function body.
