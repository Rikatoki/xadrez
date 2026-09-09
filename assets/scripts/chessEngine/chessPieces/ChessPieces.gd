@abstract
extends Object
class_name ChessBasePiece

var piece_coordinate: Vector2i = Vector2i.ZERO

var piece_team: ChessEnums.ChessTeam

func set_coordinate(coordinate: Vector2i) -> ChessBasePiece:
	piece_coordinate = coordinate
	return self


func on_board() -> bool:
	return piece_coordinate != Vector2i.ZERO


func _get_team_str() -> String:
	return "w" if piece_team == ChessEnums.ChessTeam.WHITE else "b"
