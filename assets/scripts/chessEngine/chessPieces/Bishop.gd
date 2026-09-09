extends ChessBasePiece
class_name Bishop

func _to_string() -> String:
	return _get_team_str() + "b"
