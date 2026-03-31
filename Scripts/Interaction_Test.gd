extends Area2D

@onready var interaction_text: Label = $"../Interaction Text"
var interactable = true
var player_took_item = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact") && interactable == true && !player_took_item:
		for i in range(PlayerInfo.player_inventory.size()):
			if PlayerInfo.player_inventory[i] == PlayerInfo.empty:
				PlayerInfo.player_inventory[i] = Weapons.machete
				player_took_item = true
				return
			else:
				pass


func _on_area_entered(area: Area2D) -> void:
	interaction_text.visible = true
	interactable = true
	print("Interactable!")


func _on_area_exited(area: Area2D) -> void:
	interaction_text.visible = false
	interactable = false
	print("Not interactable!")
