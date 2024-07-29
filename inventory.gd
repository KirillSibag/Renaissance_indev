
extends Node2D

const SlotClass = preload("res://res/inventory/slot.png")
onready var inventory_slots = $GridContainer
var hol
onready var equip_slots = $EquipSlots.get_children()

func _ready():
	for inv_slot in inventory_slots.get_children():
		inv_slot.connect("gui_input",self, "slot_gui_input", [inv_slot])

func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if holding_item != null:
				if !slot.item:
					slot.putIntoSlot(holding_item)
				else:
					var temp_item = slot.item
					slot.pickFromSlot()
					temp_item.global_position = event.global_position
					
			elif slot.item:
				left_click_not_holding(slot)
				
func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()
		
		