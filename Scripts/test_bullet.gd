extends Node2D

var velo := 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	velo *= PlayerInfo.direction


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x +=velo
	pass
