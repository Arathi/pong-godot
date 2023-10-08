@tool
class_name Bar
extends Area2D



@export var player: GameScene.Player = GameScene.Player.None
@export var color: Color = Color(1, 1, 1)
@export var step: float = 10


@onready var shape: RectangleShape2D = get_node("CollisionShape2D").shape


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Engine.is_editor_hint():
	#	queue_redraw()
	pass


func _draw():
	draw_rect(
		Rect2(
			-shape.size.x / 2, 
			-shape.size.y / 2, 
			shape.size.x, 
			shape.size.y
		),
		color,
		true,
		1
	)
	pass


func move_up():
	position.y -= step


func move_down():
	position.y += step


func _on_area_entered(area):
	if area.is_in_group("balls"):
		var ball = area as Ball
		ball.rebound_x()
