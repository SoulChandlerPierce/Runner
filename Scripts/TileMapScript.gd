extends TileMap

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
var random = 0
func _random_map():
	_clear()
	if random==0:
		set_cell(22,2,2)
		set_cell(35,2,2)
		set_cell(48,2,2)
		

func _clear():
	for i in range(40):
		for y in range(5):
			set_cell(i+20,y-2,3)
