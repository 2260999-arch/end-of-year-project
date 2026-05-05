extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var interact_ui: PanelContainer = $InteractUI
@onready var inventory_full: PanelContainer = $InventoryFull



var has_been_opened = false
var in_range = false
var inventory_full_bool = false
# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if in_range && !has_been_opened && !inventory_full_bool:
		interact_ui.visible = true
		inventory_full.visible = false
	elif inventory_full_bool && in_range:
		inventory_full.visible = true
		interact_ui.visible = false
	else:
		interact_ui.visible = false
		inventory_full.visible = false
	if Input.is_action_just_pressed("Interact") && in_range && !has_been_opened:
		for i in range(PlayerInfo.player_inventory.size()):
			if PlayerInfo.player_inventory[i] == PlayerInfo.empty:
				PlayerInfo.player_inventory[i] = LootTables.roll_table(LootTables.armors_table)
				has_been_opened = true
				interact_ui.visible = false
				animated_sprite_2d.play("open")
				return
			else:
				pass
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if has_been_opened:
		pass
	else:
		in_range = true
		for i in range(PlayerInfo.player_inventory.size()):
			if PlayerInfo.player_inventory[i] == PlayerInfo.empty:
				inventory_full_bool = false
				return
			else:
				inventory_full_bool = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	in_range = false
