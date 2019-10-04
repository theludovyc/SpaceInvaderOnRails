extends Node2D

var alienBall = preload("res://Prefab/Alien_Ball.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal alien_dead(me)
signal alien_ready(me)

var dead:=true

# Called when the node enters the scene tree for the first time.
func appear():
	$AnimationPlayer.play("Appear")
	yield($AnimationPlayer, "animation_finished")
	emit_signal("alien_ready", self)

#func _ready():
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
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
	if area.name=="BigLaser" and !dead:
		$AnimatedSprite.self_modulate.a=0
		dead=true
		emit_signal("alien_dead", self)
	pass # Replace with function body.
