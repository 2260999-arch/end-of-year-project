extends Control

@onready var item_image: TextureRect = $Item_Image
@onready var item_name: Label = $"Item Name"
@onready var equip: Button = $Equip
@onready var discard: Button = $Discard
@onready var equipped_discard: Button = $Equipped_Discard
@onready var unequip: Button = $Unequip
@onready var desc_label: Label = $"TabContainer/Desc/Desc Label"
@onready var stats_label: Label = $"TabContainer/Stats/Stats Label"
@onready var head: Button = $Head
@onready var body: Button = $Body
@onready var legs: Button = $Legs
@onready var weapon: Button = $Weapon
@onready var special: Button = $Special
@onready var armor_buff_label: Label = $"Armor Buff Label"

var current_item = 0
var current_equipped = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Changes the inventory menu for equipping, unequipping, and discarding tool buttons,
#  weapon stats, and weapon descriptions.
func _on_item_pressed(item_num:int)->void:
	if PlayerInfo.player_inventory[item_num] != null:
		item_name.text = PlayerInfo.player_inventory[item_num][0]
		if PlayerInfo.player_inventory[item_num][0] != "EMPTY":
			current_item = item_num
			print(current_item)
			equip.visible = true
			unequip.visible = false
			discard.visible = true
			equipped_discard.visible = false
			if PlayerInfo.player_inventory[item_num][5] == "Weapon":
				stats_label.text = ("Type: " + PlayerInfo.player_inventory[item_num][1] + '\n' + 
								"Atk: " + str(PlayerInfo.player_inventory[item_num][2])+ '\n'+
								"Cd: " +str(PlayerInfo.player_inventory[item_num][3]))
			elif PlayerInfo.player_inventory[item_num][5] == "Armor":
				stats_label.text = ("Type: " + str(PlayerInfo.player_inventory[item_num][1]) + '\n' + 
									"Negates " + str(PlayerInfo.player_inventory[item_num][2]) + " damage.")
			elif PlayerInfo.player_inventory[item_num][5] == "Special":
				if PlayerInfo.player_inventory[item_num][1] == "Speed" || PlayerInfo.player_inventory[item_num][1] ==  "Jump":
					stats_label.text = ("Type: " + PlayerInfo.player_inventory[item_num][3] + '\n' +
								"Increases " + PlayerInfo.player_inventory[item_num][1] + " by x" + 
								str(PlayerInfo.player_inventory[item_num][2]) + ".")
				if PlayerInfo.player_inventory[item_num][1] == "Cooldown":
					stats_label.text = ("Reduces cooldown for "+ PlayerInfo.player_inventory[item_num][3] +  " by "
					  + PlayerInfo.player_inventory[item_num][1] + "seconds.")
			desc_label.text = (PlayerInfo.player_inventory[item_num][4])
		else:
			stats_label.text = ""
			desc_label.text = ""
			equip.visible = false
			unequip.visible = false
			discard.visible = false
			equipped_discard.visible = false

func on_equipped_item_pressed(item_num:int)->void:
	if PlayerInfo.equipped_items[item_num] != null:
		item_name.text = PlayerInfo.equipped_items[item_num][0]
		if PlayerInfo.equipped_items[item_num][0] != "EMPTY" && PlayerInfo.equipped_items[item_num][0] != "Hands":
			unequip.visible = true
			discard.visible = false
			equip.visible = false
			equipped_discard.visible = true
			if PlayerInfo.equipped_items[item_num][5] == "Weapon":
				stats_label.text = ("Type: " + PlayerInfo.equipped_items[item_num][1] + '\n' + 
								"Atk: " + str(PlayerInfo.equipped_items[item_num][2])+ '\n'+
								"Cd: " +str(PlayerInfo.equipped_items[item_num][3]))
			elif PlayerInfo.equipped_items[item_num][5] == "Armor":
				stats_label.text = ("Type: " + str(PlayerInfo.equipped_items[item_num][1]) + '\n' + 
									"Negates " + str(PlayerInfo.equipped_items[item_num][2]) + " damage.")
			elif PlayerInfo.equipped_items[item_num][5] == "Special":
				if PlayerInfo.equipped_items[item_num][1] == "Speed" || PlayerInfo.equipped_items[item_num][1] ==  "Jump":
					stats_label.text = ("Type: " + PlayerInfo.equipped_items[item_num][3] + '\n' +
								"Increases " + PlayerInfo.equipped_items[item_num][1] + " by x" + 
								str(PlayerInfo.equipped_items[item_num][2]) + ".")
				if PlayerInfo.equipped_items[item_num][1] == "Cooldown":
					stats_label.text = ("Reduces cooldown for "+ PlayerInfo.equipped_items[item_num][3] +  " by "
					  + PlayerInfo.equipped_items[item_num][1] + "seconds.")
			desc_label.text = (PlayerInfo.equipped_items[item_num][4])
		elif PlayerInfo.equipped_items[item_num][0] == "Hands":
			unequip.visible = false
			equip.visible = false
			discard.visible = false
			equipped_discard.visible = false
			desc_label.text = (PlayerInfo.equipped_items[item_num][4])
			stats_label.text = ("Type: " + PlayerInfo.equipped_items[item_num][1] + '\n' + 
								"Atk: " + str(PlayerInfo.equipped_items[item_num][2])+ '\n'+
								"Cd: " +str(PlayerInfo.equipped_items[item_num][3]))
		else:
			stats_label.text = ""
			desc_label.text = ""
			equip.visible = false
			unequip.visible = false
			discard.visible = false
			equipped_discard.visible = false
	
# Inventory slot buttons
func _on_item_1_pressed() -> void:
	_on_item_pressed(0)



func _on_item_2_pressed() -> void:
	_on_item_pressed(1)



func _on_item_3_pressed() -> void:
	_on_item_pressed(2)


func _on_item_4_pressed() -> void:
	_on_item_pressed(3)


func _on_item_5_pressed() -> void:
	_on_item_pressed(4)


func _on_item_6_pressed() -> void:
	_on_item_pressed(5)


func _on_item_7_pressed() -> void:
	_on_item_pressed(6)


func _on_item_8_pressed() -> void:
	_on_item_pressed(7)


func _on_item_9_pressed() -> void:
	_on_item_pressed(8)


func _on_item_10_pressed() -> void:
	_on_item_pressed(9)


func _on_item_11_pressed() -> void:
	_on_item_pressed(10)


func _on_item_12_pressed() -> void:
	_on_item_pressed(11)


func _on_item_13_pressed() -> void:
	_on_item_pressed(12)


func _on_item_14_pressed() -> void:
	_on_item_pressed(13)


func _on_item_15_pressed() -> void:
	_on_item_pressed(14)


func _on_item_16_pressed() -> void:
	_on_item_pressed(15)


func _on_discard_pressed() -> void:
	PlayerInfo.player_inventory[current_item] = PlayerInfo.empty
	_on_item_pressed(current_item)


func _on_visibility_button_pressed() -> void:
	visible = false
	Engine.time_scale = 1


func _on_head_pressed() -> void:
	on_equipped_item_pressed(2)
	current_equipped = 2

func _on_body_pressed() -> void:
	on_equipped_item_pressed(3)
	current_equipped = 3

func _on_legs_pressed() -> void:
	on_equipped_item_pressed(4)
	current_equipped = 4

func _on_weapon_pressed() -> void:
	on_equipped_item_pressed(0)
	current_equipped = 0

func _on_special_pressed() -> void:
	on_equipped_item_pressed(1)
	current_equipped = 1

func _on_equip_pressed() -> void:
	var item
	print("test")
	if PlayerInfo.player_inventory[current_item][5] == "Weapon":
		if PlayerInfo.equipped_items[0] == PlayerInfo.hands:
			PlayerInfo.equipped_items[0] = PlayerInfo.player_inventory[current_item]
			PlayerInfo.player_inventory[current_item] = PlayerInfo.empty
			on_equipped_item_pressed(0)
		else:
			item = PlayerInfo.equipped_items[0]
			PlayerInfo.equipped_items[0] = PlayerInfo.player_inventory[current_item]
			PlayerInfo.player_inventory[current_item] = item
			on_equipped_item_pressed(current_item)
			
	elif PlayerInfo.player_inventory[current_item][5] == "Armor":
		if PlayerInfo.player_inventory[current_item][3] == "Head":
			item = PlayerInfo.equipped_items[2]
			PlayerInfo.equipped_items[2] = PlayerInfo.player_inventory[current_item]
			PlayerInfo.player_inventory[current_item] = item
			on_equipped_item_pressed(2)
		if PlayerInfo.player_inventory[current_item][3] == "Chest":
			item = PlayerInfo.equipped_items[3]
			PlayerInfo.equipped_items[3] = PlayerInfo.player_inventory[current_item]
			PlayerInfo.player_inventory[current_item] = item
			on_equipped_item_pressed(3)
		if PlayerInfo.player_inventory[current_item][3] == "Legs":
			item = PlayerInfo.equipped_items[4]
			PlayerInfo.equipped_items[4] = PlayerInfo.player_inventory[current_item]
			PlayerInfo.player_inventory[current_item] = item
			on_equipped_item_pressed(4)
	elif PlayerInfo.player_inventory[current_item][5] == "Special":
		item = PlayerInfo.equipped_items[1]
		PlayerInfo.equipped_items[1] = PlayerInfo.player_inventory[current_item]
		PlayerInfo.player_inventory[current_item] = item
		on_equipped_item_pressed(1)
		PlayerInfo.check_booster()
	
func _on_unequip_pressed() -> void:
	for i in range(PlayerInfo.player_inventory.size()):
			if PlayerInfo.player_inventory[i] == PlayerInfo.empty:
				if current_equipped == 0:
					PlayerInfo.player_inventory[i] = PlayerInfo.equipped_items[current_equipped]
					PlayerInfo.equipped_items[current_equipped] = PlayerInfo.hands
				else:
					PlayerInfo.player_inventory[i] = PlayerInfo.equipped_items[current_equipped]
					PlayerInfo.equipped_items[current_equipped] = PlayerInfo.empty
					if PlayerInfo.equipped_items[current_equipped] == PlayerInfo.equipped_items[1]:
						PlayerInfo.check_booster()
				_on_item_pressed(i)
				return
			else:
				print("No inventory available")
				pass


func _on_equipped_discard_pressed() -> void:
	if current_equipped == 1:
		PlayerInfo.equipped_items[current_equipped] = PlayerInfo.empty
		PlayerInfo.check_booster()
		on_equipped_item_pressed(current_equipped)
	elif current_equipped == 0:
		PlayerInfo.equipped_items[current_equipped] = PlayerInfo.hands
		on_equipped_item_pressed(current_equipped)
	else:
		PlayerInfo.equipped_items[current_equipped] = PlayerInfo.empty
		on_equipped_item_pressed(current_equipped)
