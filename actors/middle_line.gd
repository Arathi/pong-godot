@tool
extends Node2D


@export var width: float = 8
@export var height: float = 900
@export var color: Color = Color(1, 1, 1)
@export var dash: float = 42.85
@export var aligned: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _draw():
	draw_dashed_line(
		Vector2(0, 0),
		Vector2(0, height),
		color,
		width,
		dash,
		aligned
	)

