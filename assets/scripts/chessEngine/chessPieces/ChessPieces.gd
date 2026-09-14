@abstract
extends Object
class_name ChessPiece

var piece_coordinate: Vector2i = Vector2i.ZERO

var piece_team: ChessEnums.ChessTeam

var has_moved: bool = false

@abstract
func get_movements() -> Array[Vector2i]

func set_coordinate(coordinate: Vector2i) -> ChessPiece:
	piece_coordinate = coordinate
	return self


func on_board() -> bool:
	return piece_coordinate != Vector2i.ZERO


func is_same_side(side: ChessEnums.ChessTeam) -> bool:
	return side == piece_team

func _get_team_str() -> String:
	return "w" if piece_team == ChessEnums.ChessTeam.WHITE else "b"
