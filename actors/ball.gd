@tool
class_name Ball
extends Area2D


const origin = Vector2(0, 0)

@export var color: Color = Color(1, 1, 1)
@export var velocity: Vector2 = Vector2(0, 0)

@onready var shape: CircleShape2D = get_node("CollisionShape2D").shape

var radius: float:
	get:
		return shape.radius 


# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_to_group("balls")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity
	pass


func rebound_x():
	velocity.x = -velocity.x
	pass


func rebound_y():
	velocity.y = -velocity.y
	pass


func _draw():
	draw_circle(origin, radius, color)
	pass

