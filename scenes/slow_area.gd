extends Area2D

@onready var circle_shape: CircleShape2D;
var player: Player = null; 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var coll_shape: CollisionShape2D = $CollisionShape2D;
	circle_shape = coll_shape.shape;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		player.my_time_scale = calculate_slowdown(player.position);


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body as Player;


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		player = null;

func calculate_slowdown(other_position: Vector2) -> float:
	var distance: float = position.distance_to(other_position);
	var slowdown: float = clamp(distance/circle_shape.radius, 0.0, 1.0);
	return slowdown;
