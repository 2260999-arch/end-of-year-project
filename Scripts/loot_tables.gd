extends Node2D

# Used to provide loot tables for chests and other interactables that give items.
@onready var num_gen = RandomNumberGenerator.new()
#Medival Gear Table
var medieval_table = [Weapons.basic_knife, Weapons.short_sword, Weapons.long_bow, Weapons.short_bow,
					 Armors.iron_helmet, Armors.chainmail_tunic, Armors.chainmail_pants,
					 Armors.steel_helmet, Armors.steel_chestplate, Armors.steel_leg_harness]

#Modern Gear Table
var modern_table = [Weapons.combat_knife, Weapons.rifle, Weapons.handcannon, Weapons.pistol,
					 Armors.combat_helmet, Armors.knee_pads, Armors.ballistic_vest,
					 Armors.advanced_combat_helmet, Armors.heavy_ballistic_vest, Armors.armored_knee_pads]

var futuristic_table = [Weapons.plasma_gun, Weapons.plasma_knife, Weapons.plasma_pistol,
						Weapons.plasma_sabre, Weapons.laser_pistol, Weapons.laser_rifle,
						Armors.srv, Armors.hple, Armors.voch]

var specials_table = [Specials.jump_boost, Specials.speed_boost, Specials.cooldown_reductor]

var weapons_table = [Weapons.basic_knife, Weapons.short_sword, Weapons.long_bow, Weapons.short_bow,
					Weapons.combat_knife, Weapons.rifle, Weapons.handcannon, Weapons.pistol,
					Weapons.plasma_gun, Weapons.plasma_knife, Weapons.plasma_pistol,
					Weapons.plasma_sabre, Weapons.laser_pistol, Weapons.laser_rifle]

var armors_table = [Armors.iron_helmet, Armors.chainmail_tunic, Armors.chainmail_pants,
					Armors.steel_helmet, Armors.steel_chestplate, Armors.steel_leg_harness,
					Armors.combat_helmet, Armors.knee_pads, Armors.ballistic_vest,
					Armors.advanced_combat_helmet, Armors.heavy_ballistic_vest, Armors.armored_knee_pads,
					Armors.srv, Armors.hple, Armors.voch]

var all_table = [Weapons.basic_knife, Weapons.short_sword, Weapons.long_bow, Weapons.short_bow,
				Armors.iron_helmet, Armors.chainmail_tunic, Armors.chainmail_pants,
				Armors.steel_helmet, Armors.steel_chestplate, Armors.steel_leg_harness,
				Weapons.combat_knife, Weapons.rifle, Weapons.handcannon, Weapons.pistol,
				Armors.combat_helmet, Armors.knee_pads, Armors.ballistic_vest,
				Armors.advanced_combat_helmet, Armors.heavy_ballistic_vest, Armors.armored_knee_pads,
				Weapons.plasma_gun, Weapons.plasma_knife, Weapons.plasma_pistol,
				Weapons.plasma_sabre, Weapons.laser_pistol, Weapons.laser_rifle,
				Armors.srv, Armors.hple, Armors.voch,
				] #Will add in specials once I finish allat

#Gives the player an item from the selected table.
func roll_table(table:Array):
	var length = table.size() -1
	print(table[num_gen.randi_range(0,length)])
	return table[num_gen.randi_range(0,length)]
