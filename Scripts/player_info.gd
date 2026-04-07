extends Node2D

var current_weapon = hands
var movable = true
var direction = 1
var empty = ["EMPTY", "N/A", "N/A", "N/A", ""]
var hands = ["Hands", "Melee", 5, 0.5, "Your hands, useful for many things, including punching."]
var player_inventory = [empty, empty, empty, empty,
						empty, empty, empty, empty, 
						empty, empty, empty, empty, 
						empty, empty, empty, empty]
var equipped_items = [hands, empty, empty, empty, empty]
func _ready() -> void:
	player_inventory[0] = Weapons.short_sword
	player_inventory[1] = Weapons.rifle
	player_inventory[2] = Armors.steel_leg_harness
