extends Panel



var ItemClass = preload("res://res/inventory/item.tscn")
var item = null

# Called when the node enters the scene tree for the first time.
func _ready():
	if randi() % 2 == 0:
		item = ItemClass.instance()
		add_child(item)



