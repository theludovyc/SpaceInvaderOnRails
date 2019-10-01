extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Alien = preload("res://Prefab/Alien.tscn")
const AlienConst = 80
const AlienX=5
const AlienY=3

# Called when the node enters the scene tree for the first time.
func _ready():
	for j in range(AlienY):
		for i in range(AlienX):
			var alien = Alien.instance()
			add_child(alien)
			alien.position = Vector2( (i+1)*AlienConst , (j+1)*AlienConst )
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Timer_timeout():
	var childs = get_child_count()
	if childs>0:
		get_child(randi()%childs).shoot()
	pass # Replace with function body.
