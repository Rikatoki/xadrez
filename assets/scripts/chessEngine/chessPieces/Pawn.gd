extends ChessBasePiece
class_name Pawn

func _to_string() -> String:
	return _get_team_str() + "p"
