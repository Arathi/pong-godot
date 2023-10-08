@tool
class_name GameScene
extends Node2D


enum Player {
	None,
	Left,
	Right,
}


# signal goal


@onready var ball: Ball = get_node("ball")
@onready var bar_left: Bar = get_node("bar_left")
@onready var bar_right: Bar = get_node("bar_right")


var score_left: int = 0
var score_right: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	connect("goal", Callable(self, "do_goal"))
	start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event is InputEventKey and event.is_pressed():
		match event.keycode:
			# left
			KEY_W: bar_left.move_up()
			KEY_S: bar_left.move_down()
			# right
			KEY_UP: bar_right.move_up()
			KEY_DOWN: bar_right.move_down()


func start():
	# 重置小球位置
	ball.position.x = 800
	ball.position.y = 450
	
	# 生成小球初速度
	ball.velocity = random_velocity(5, 10)
	
	bar_left.position.x = 50
	bar_left.position.y = 450
	bar_right.position.x = 1600 - 50
	bar_right.position.y = 450
	
	pass


func random_velocity(speed_min: float, speed_max: float) -> Vector2:
	# print("正在生成随机速度[%f,%f]" % [speed_min, speed_max])
	var delta = speed_max - speed_min
	var s = speed_min + delta * randf()
	# print("生成速率：%f p/s" % s)
	
	var x = 0.5 * s + 0.5 * s * randf()
	var y = sqrt(s*s - x*x)
	if randi() % 2 == 1:
		x = -x
	if randi() % 2 == 1:
		y = -y
	# print("生成速度：(%f,%f) p/s" % [x, y])
	
	return Vector2(x, y)


func do_goal(player: Player):
	print("玩家 %d 进球" % player)
	match player:
		Player.Left: score_left += 1
		Player.Right: score_right += 1
	
	print("比分：%d - %d" % [score_left, score_right])
	start()
