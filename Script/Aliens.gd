extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Alien = preload("res://Prefab/Alien.tscn")
const AlienConst = 80
const AlienX=5
const AlienY=3

var aliens_ready = []
var aliens_dead = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for j in range(AlienY):
		for i in range(AlienX):
			var alien = Alien.instance()
			add_child(alien)
			alien.connect("alien_ready", self, "_on_alien_ready")
			alien.connect("alien_dead", self, "_on_alien_dead")
			alien.position = Vector2( (i+1)*AlienConst , (j+1)*AlienConst )
			alien.appear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_alien_ready(alien):
	aliens_ready.push_front(alien)

func moveAlien(alien):
	remove_child(alien)
	yield(self, "tree_exited")
	$Aliens_dead.add_child(alien)
	
func _on_alien_dead(alien):
	call_deferred("moveAlien", alien)

func _on_Timer2_timeout():
	if !aliens_dead.empty():
		var alien = aliens_dead.pop_front()
		add_child(alien)
		alien.appear()

func _on_Timer_timeout():
	if !aliens_ready.empty():
		get_child(randi()%aliens_ready.size()).shoot()
