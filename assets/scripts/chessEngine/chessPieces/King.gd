extends ChessBasePiece
class_name King

func _to_string() -> String:
	return _get_team_str() + "k"
