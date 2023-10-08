extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group("walls")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.is_in_group("balls"):
		var ball = area as Ball
		ball.rebound_y()
	pass # Replace with function body.
