extends ChessBasePiece
class_name Queen

func _to_string() -> String:
	return _get_team_str() + "q"
