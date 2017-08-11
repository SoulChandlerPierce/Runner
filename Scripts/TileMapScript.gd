extends TileMap

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_cell(23,0,2)
	_clear()
	pass
	
func _random_map():
	_clear()

func _clear():
	for i in range(40):
		for y in range(5):
			set_cell(i+20,y-2,3)
