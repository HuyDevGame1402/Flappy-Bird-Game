extends Area2D

# Tốc độ di chuyển của vật thể
var speed = 100
var default : bool = true
# Phương thức này được gọi mỗi khung hình
func _process(delta):
	if get_parent().state:
		var movement = Vector2(-speed * delta, 0)
		position += movement
		pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	get_parent().columns_down.append(self)
	visible = false

func _on_body_entered(body):
	get_parent().state = false
	body.state = false
	pass # Replace with function body.
