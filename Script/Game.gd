extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Alien = preload("res://Prefab/Alien.tscn")
const AlienConst = 80
const AlienX=5
const AlienY=3
var aliens = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for j in range(AlienY):
		for i in range(AlienX):
			var alien = Alien.instance()
			add_child(alien)
			alien.position = Vector2( (i+1)*AlienConst , (j+1)*AlienConst )
			aliens.append(alien)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Timer_timeout():
	aliens[randi()%(AlienX*AlienY)].shoot()
	pass # Replace with function body.
