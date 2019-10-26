extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score:=0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_text_score():
	text = str(score)

func add(i):
	score+=i
	update_text_score()
	
func sub(i):
	score-=i
	update_text_score()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
