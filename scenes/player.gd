extends CharacterBody2D


@export var speed: float = 400.0

const FRICTION = 0.5

func _physics_process(delta: float) -> void:
	
	#var mouse_vector: Vector2 = get_viewport().get_mouse_position();	#speed should be 15
	
	var direction_x: float;
	var direction_y: float;
	var move_vector: Vector2;
	
	direction_x = Input.get_axis("ui_left", "ui_right");
	direction_y = Input.get_axis("move_up", "move_down");
	move_vector = Vector2(direction_x, direction_y);
	move_vector = move_vector.normalized();
	
	velocity = (move_vector) * speed;
	#velocity = (mouse_vector - position) * speed;
	
		
	move_and_slide()
