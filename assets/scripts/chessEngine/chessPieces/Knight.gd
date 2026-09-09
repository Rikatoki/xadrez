extends ChessBasePiece
class_name Knight

func _to_string() -> String:
	return _get_team_str() + "h"
