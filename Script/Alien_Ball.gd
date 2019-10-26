extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal outside

const SPEED=200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y+=SPEED*delta
	
	if position.y>700:
		emit_signal("outside")
		queue_free()
#	pass


func _on_Alien_Ball_area_entered(area):
	if area.name == "BigLaser":
		queue_free()
	pass # Replace with function body.
