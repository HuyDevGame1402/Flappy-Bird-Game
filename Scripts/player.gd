extends CharacterBody2D

const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var state : bool = true
@onready var audio_player = $AnimationPlayer
func _physics_process(delta):
	# Add the gravity.
	if state:
		if not is_on_floor():
			velocity.y += gravity * 0.8 * delta
		
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_VELOCITY
		move_and_slide()

	if !state:
		set_physics_process(false)
		audio_player.play("audio_hit")
		await audio_player.animation_finished
