extends Node2D

@export var column_down : PackedScene
@export var column_up : PackedScene
var file_path: String = "res://Scripts/max_score.json"
var _score : int = 0
var max_score : int = 0
var spawn_interval = 3.0
var time_since_last_spawn = 0.0
var state : bool =true
var check : bool = false
@onready var player = $player
@onready var score = $HBoxContainer/Label2
@onready var max_Score = $HBoxContainer/Label4
@onready var gameOver = $game_over
@onready var backgroundNight = $Backgroundnight
@onready var backgrounDay = $"GiaoDiện-game"
# Danh sách các cột hiện tại
var columns = []
var columns_up : Array = []
var columns_down: Array = []


func _process(delta):
		if player.state:
			time_since_last_spawn += delta
			if time_since_last_spawn >= spawn_interval:
				spawn_column()
				time_since_last_spawn = 0.0
			change_background()
		if !state:
			gameOver.visible = true

			gameOver.set_deferred("z_index", 1)
			if Input.is_action_just_pressed("ui_up"):
				#get_tree().reload_current_scene()
				reaload_game()

		check_columns_passed()
func change_background():
	if _score > 5 and _score < 10:
		backgroundNight.set_deferred("visible", true)
	elif _score > 10:
		backgroundNight.set_deferred("visible", false)
	pass
		
func spawn_column():
	var position_rand_y = randi_range(100, 360)

	var column_Down = column_down.instantiate()
	var column_Up = column_up.instantiate()
	column_Down.position = Vector2(380, position_rand_y)
	column_Up.position = Vector2(380, position_rand_y + 180)
	get_tree().current_scene.add_child(column_Down)
	get_tree().current_scene.add_child(column_Up)
	columns_up.append(column_Up)
	columns_down.append(column_Down)
	columns.append(column_Down)
	pass

func check_columns_passed():
	for column in columns:
		if column.position.x < player.position.x:
			print("Check")
			_score += 1
			if max_score < _score:
				max_score += 1
			update_score_label()
			columns.erase(column)

func update_score_label():
	score.text = str(_score)
	max_Score.text = str(max_score)


func reaload_game():
	player.set_physics_process(true)
	player.velocity = Vector2.ZERO
	columns = []
	gameOver.set_deferred("visible", false)
	player.global_position = Vector2(77, 285)
	
	if backgroundNight.visible:
		backgroundNight.visible = false
		backgrounDay.visible = true
	
	for column in columns_up:
		column.queue_free()
	
	columns_up.clear()
	
	for column in columns_down:
		column.queue_free()
	columns_down.clear()
	_score = 0
	update_score_label()
	state = true
	player.state = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	state = false
	body.state = false
