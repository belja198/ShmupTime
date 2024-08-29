extends CharacterBody2D
class_name Player

@export var speed: float = 400.0
@onready var firing_point: Node2D = $FirePoint;
@export var my_time_scale: float = 1.0;

@onready var rich_text_label: RichTextLabel = $RichTextLabel

const PROJECTILE: PackedScene = preload("res://scenes/projectile.tscn")

func _physics_process(delta: float) -> void:
	
	#var mouse_vector: Vector2 = get_viewport().get_mouse_position();	#speed should be 15
	GlobalScript.world_time_scale = my_time_scale;
	
	var direction_x: float;
	var direction_y: float;
	var move_vector: Vector2;
	
	direction_x = Input.get_axis("ui_left", "ui_right");
	direction_y = Input.get_axis("move_up", "move_down");
	move_vector = Vector2(direction_x, direction_y);
	move_vector = move_vector.normalized();
	
	velocity = (move_vector) * speed * my_time_scale;
	#velocity = (mouse_vector - position) * speed;
	move_and_slide()
	
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot();
		
	rich_text_label.text = str(my_time_scale);



func shoot() -> void:
	var proj: Projectile = PROJECTILE.instantiate();
	get_tree().get_root().add_child(proj);
	proj.global_position = firing_point.global_position;
	#print("Is in scene tree: ", proj.is_inside_tree())

