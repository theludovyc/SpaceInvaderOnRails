extends Node2D

var alienBall = preload("res://Prefab/Alien_Ball.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		shoot()
#	pass

func shoot():
	if $Timer.is_stopped():
		$AnimatedSprite.animation="Shoot"
		$Timer.start()

func _on_Timer_timeout():
	$AnimatedSprite.animation="Default"
	var ball = alienBall.instance()
	add_child(ball)
	ball.position.y+=28
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	if area.name=="BigLaser":
		queue_free()
	pass # Replace with function body.
