extends CharacterBody2D
class_name Player

@export var speed: float = 400.0;

@onready var firing_point_1: Node2D = $FirePoint1;
@onready var firing_point_2: Node2D = $FirePoint2;
var can_shoot: bool = true;

@export var my_time_scale: float = 1.0;
@export var lives: int = 3;

@onready var coyote_timer: Timer = $CoyoteTimer;
@onready var invincible_timer: Timer = $InvincibleTimer;
@onready var shoot_timer: Timer = $ShootTimer;

var is_coyote: bool = false;
var is_invincible: bool = false;


@onready var rich_text_label: RichTextLabel = $RichTextLabel

const PROJECTILE: PackedScene = preload("res://scenes/projectile_player_first.tscn")

func _ready() -> void:
	GlobalScript.player = self;

func _physics_process(delta: float) -> void:
	
	#var mouse_vector: Vector2 = get_viewport().get_mouse_position();	#speed should be 15
	GlobalScript.world_time_scale = my_time_scale;
	
	var direction_x: float = 0;
	var direction_y: float = 0;
	var move_vector: Vector2;
	
	if Input.is_action_pressed("move_right"):
		direction_x += 1;

	if Input.is_action_pressed("move_left"):
		direction_x -= 1;

	
	if Input.is_action_pressed("move_down"):
		direction_y += 1;

	if Input.is_action_pressed("move_up"):
		direction_y -= 1;

	#direction_x = Input.get_axis("move_left", "move_right");
	#direction_y = Input.get_axis("move_up", "move_down");
	move_vector = Vector2(direction_x, direction_y);
	move_vector = move_vector.normalized();
	
	velocity = (move_vector) * speed * my_time_scale;
	#velocity = (mouse_vector - position) * speed;
	move_and_slide()
	
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot") && can_shoot:
		shoot();
		
	rich_text_label.text = str(lives);



func shoot() -> void:
	var proj_1: ProjectileBase = PROJECTILE.instantiate();
	get_tree().get_root().add_child(proj_1);
	proj_1.global_position = firing_point_1.global_position;
	var proj_2: ProjectileBase = PROJECTILE.instantiate();
	get_tree().get_root().add_child(proj_2);
	proj_2.global_position = firing_point_2.global_position;
	
	can_shoot = false;
	shoot_timer.start();


func get_hit() -> void:
	if is_invincible:
		return;

	if !is_coyote:
		is_coyote = true;
		coyote_timer.start();
		modulate.r = 1.0;
		modulate.g = 0.0;
		modulate.b = 0.0;
	else:
#	if !is_coyote:
#		is_coyote = true;
#		coyote_timer.start();
#		modulate.r = 1.0;
#		modulate.g = 0.0;
#		modulate.b = 0.0;
#	else:
		# stop coyote timer
		coyote_timer.stop();
		lives = lives - 1;
		if lives == 0:
			print("DEAD");
		is_coyote = false;
		is_invincible = true;
		invincible_timer.start();
		modulate.r = 0.0;
		modulate.g = 0.0;
		modulate.b = 1.0;
#		coyote_timer.stop();
	lives = lives - 1;
	if lives == 0:
		print("DEAD");
#	is_coyote = false;
	is_invincible = true;
	invincible_timer.start();
	modulate.r = 0.0;
	modulate.g = 0.0;
	modulate.b = 1.0;




func _on_invincible_timer_timeout() -> void:
	is_invincible = false;
	modulate.r = 1.0;
	modulate.g = 1.0;
	modulate.b = 1.0;

func _on_coyote_timer_timeout() -> void:
	is_coyote = false;
	modulate.r = 1.0;
	modulate.g = 1.0;
	modulate.b = 1.0;

func _on_shoot_timer_timeout() -> void:
	can_shoot = true;
