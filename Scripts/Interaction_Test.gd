extends Area2D

@onready var interaction_text: Label = $"../Interaction Text"
var interactable = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact") && interactable == true:
		PlayerInfo.has_gun = true


func _on_area_entered(area: Area2D) -> void:
	interaction_text.visible = true
	interactable = true
	print("Interactable!")


func _on_area_exited(area: Area2D) -> void:
	interaction_text.visible = false
	interactable = false
	print("Not interactable!")
