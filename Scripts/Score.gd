extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass


var score = 0

func _fixed_process(delta):
	score += 1
	set_text("Score: " + str(score))
	
func _end():
	set_fixed_process(false)