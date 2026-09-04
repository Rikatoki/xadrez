extends ChessPiece
class_name Knight

func interact_square(_square: ChessSquare) -> void:
	return

func _can_move(_square: ChessSquare) -> bool:
	var difference: Vector2i = (_square.coordinate - square.coordinate).abs()
	var has_ally: bool = false
	if _square.has_piece():
		has_ally = is_same_side(_square.piece)
	return _square != square and ((difference.x == 1 and difference.y == 2) or (difference.x == 2 and difference.y == 1)) and not has_ally
