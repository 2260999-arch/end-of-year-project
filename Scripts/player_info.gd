extends Node2D

var movable = true
var direction = 1
var speed = 300.0
var jump_velo = -300.0
var empty = ["EMPTY", "N/A", "N/A", "N/A", ""]
var hands = ["Hands", "Melee", 5, 0.5, "Your hands, useful for many things, including punching. Replaced when you equip another weapon.", "Weapon"]
var player_inventory = [empty, empty, empty, empty,
						empty, empty, empty, empty, 
						empty, empty, empty, empty, 
						empty, empty, empty, empty]
var equipped_items = [hands, empty, empty, empty, empty]
#testing things, remove when done
func _ready() -> void:
	player_inventory[0] = Weapons.short_sword
	player_inventory[1] = Weapons.rifle
	player_inventory[2] = Armors.steel_helmet
	player_inventory[3] = Specials.speed_boost

func check_booster() -> void:
	var temp = 0.0
	if equipped_items[1][1] == "Speed" && speed == 300.0:
		temp = speed * equipped_items[1][2]
		speed = speed + temp
	else:
		speed = 300.0
	if equipped_items[1][1] == "Jump" && jump_velo == -300.0:
		temp = jump_velo * equipped_items[1][2]
		jump_velo = temp + jump_velo
	else:
		jump_velo = -300.0
		
