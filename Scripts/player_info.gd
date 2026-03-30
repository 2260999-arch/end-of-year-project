extends Node2D


var direction = 1
var has_gun = false
var empty = ["EMPTY", "N/A", "N/A", "N/A", ""]
var player_inventory = [empty, empty, empty, empty,
						empty, empty, empty, empty, 
						empty, empty, empty, empty, 
						empty, empty, empty, empty]
func _ready() -> void:
	player_inventory[0] = Weapons.basic_sword
	player_inventory[1] = Weapons.rifle
