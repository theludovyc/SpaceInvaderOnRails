extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Alien = preload("res://Prefab/Alien.tscn")
const AlienConst = 80
const AlienX=5
const AlienY=3

var aliens_dead = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for j in range(AlienY):
		for i in range(AlienX):
			var alien = Alien.instance()
			$Aliens.add_child(alien)
			alien.connect("alien_dead", self, "_on_alien_dead")
			alien.position = Vector2( (i+1)*AlienConst , (j+1)*AlienConst )
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func moveAlien(alien):
	$Aliens.remove_child(alien)
	aliens_dead.push_back(alien)
	
func _on_alien_dead(alien):
	call_deferred("moveAlien", alien)
	pass

func _on_Timer2_timeout():
	if !aliens_dead.empty():
		var alien = aliens_dead.pop_front()
		$Aliens.add_child(alien)
		alien.appear()
	pass # Replace with function body.
