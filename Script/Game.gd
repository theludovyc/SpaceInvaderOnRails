extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Alien = preload("res://Prefab/Alien.tscn")
const AlienConst = 80
const AlienX=5
const AlienY=3

var bla:=0

# Called when the node enters the scene tree for the first time.
func _ready():
	for j in range(AlienY):
		for i in range(AlienX):
			var alien = Alien.instance()
			$Aliens_appear.add_child(alien)
			alien.connect("alien_ready", self, "_on_alien_ready")
			alien.connect("alien_dead", self, "_on_alien_dead")
			alien.position = Vector2( (i+1)*AlienConst , (j+1)*AlienConst )
			alien.appear()
	pass # Replace with function body.

func _on_alien_ready(alien):
	$Aliens_appear.remove_child(alien)
	alien.dead=false
	$Aliens.add_child(alien)
	pass

func moveAlien(alien):
	$Aliens.remove_child(alien)
	$Aliens_dead.add_child(alien)
	pass
	
func _on_alien_dead(alien):
	call_deferred("moveAlien", alien)

func _on_Timer2_timeout():
	var childs = $Aliens_dead.get_child_count()
	if childs>0:
		var alien = $Aliens_dead.get_child(0)
		$Aliens_dead.remove_child(alien)
		$Aliens_appear.add_child(alien)
		alien.appear()

func _on_Timer_timeout():
	var childs = $Aliens.get_child_count()
	if childs>0:
		$Aliens.get_child(randi()%childs).shoot()
	pass
