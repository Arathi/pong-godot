extends Area2D


signal goal(player: GameScene.Player)


@export var player: GameScene.Player = GameScene.Player.None


# Called when the node enters the scene tree for the first time.
func _ready():
	var game_scene: GameScene = get_node("..")
	connect("goal", Callable(game_scene, "do_goal"))
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area: Area2D):
	if area.is_in_group("balls"):
		# print("球在玩家%d方向出界" % player)
	
		var goal_player = GameScene.Player.None
		match player:
			GameScene.Player.Left: goal_player = GameScene.Player.Right
			GameScene.Player.Right: goal_player = GameScene.Player.Left
		
		goal.emit(goal_player)
