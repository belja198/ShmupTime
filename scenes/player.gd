extends CharacterBody2D
class_name Player

@export var speed: float = 400.0;

@onready var firing_point_1: Node2D = $FirePoint1;
@onready var firing_point_2: Node2D = $FirePoint2;
var can_shoot: bool = true;

@export var lives: int = 3;

@onready var invincible_timer: Timer = $InvincibleTimer;
@onready var shoot_timer: Timer = $ShootTimer;

var is_invincible: bool = false;

signal player_death;
signal player_lost_life;

const PROJECTILE: PackedScene = preload("res://scenes/projectile_player_first.tscn")

func _ready() -> void:
	GlobalScript.player = self;

func _physics_process(delta: float) -> void:

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

	move_vector = Vector2(direction_x, direction_y);
	move_vector = move_vector.normalized();
	
	velocity = move_vector * speed;
	move_and_slide()
	
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot") && can_shoot:
		shoot();

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
	lives = lives - 1;
	player_lost_life.emit();
	if lives == 0:
		player_death.emit();
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

func _on_shoot_timer_timeout() -> void:
	can_shoot = true;
