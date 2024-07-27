extends CharacterBody2D


const SPEED = 90.0
const JUMP_VELOCITY = -275.0

var cena_a_carregar : String = "res://Scenes/menu.tscn"
@onready var animated_sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func Exit_menu():
	if Input.is_action_just_pressed("exit"):
		var nova_cena = load(cena_a_carregar)
		get_tree().change_scene_to_packed(nova_cena)


func _physics_process(delta):
	# Add the gravity.a
	if not is_on_floor():
		velocity.y += gravity * delta
		

	if Input.is_action_just_pressed("exit"):
		var nova_cena = load(cena_a_carregar)
		get_tree().change_scene_to_packed(nova_cena)

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move-left", "move-right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
