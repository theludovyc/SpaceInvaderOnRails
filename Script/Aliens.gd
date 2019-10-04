extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal my_tree_exited(node)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func removeChild(node):
	remove_child(node)
	node.owner=null
	emit_signal("my_tree_exited", node)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
