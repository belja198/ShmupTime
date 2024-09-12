extends Node2D

@export var cooldown: float = 1.0;
@export var enemy_tscn: PackedScene;
var marker_nodes: Array[Marker2D];
var waves: int = 1;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is Marker2D:
			marker_nodes.append(child)


func _process(delta: float) -> void:
	if waves != 0:
		#spawn();
		waves -= 1;


func spawn() -> void:
	for marker in marker_nodes:
		var enemy: EnemyBase = enemy_tscn.instantiate();
		enemy.position = marker.position;
		get_tree().get_root().add_child(enemy);

func _on_spawn_timer_timeout() -> void:
	pass;
