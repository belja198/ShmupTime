extends SpawnerBase
class_name SpawnerPosition

var marker_nodes: Array[Marker2D];
var enemy_index: int = 0;

func _ready() -> void:
	super._ready();
	for child in get_children():
		if child is Marker2D:
			marker_nodes.append(child)

	enemies_to_spawn = marker_nodes.size();

func spawn() -> void:
	var curr_marker: Marker2D = marker_nodes[marker_nodes.size() - enemies_to_spawn];
	var new_enemy: EnemyBase = enemy_tscn.instantiate();
	new_enemy.position = curr_marker.position;
	get_tree().get_root().add_child(new_enemy);


