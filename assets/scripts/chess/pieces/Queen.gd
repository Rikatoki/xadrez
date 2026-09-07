extends ChessPiece
class_name Queen

func _get_piece_name() -> StringName:
	return &"Queen"

func interact_square(_square: ChessSquare) -> void:
	if _square.has_piece():
		Chessboard.remove_piece(_square.piece)
	Chessboard.move_piece(self, _square)
	return

func _can_move(_square: ChessSquare) -> bool:
	var difference: Vector2i = (_square.coordinate - square.coordinate).abs()
	var has_ally: bool = false
	if _square.has_piece():
		has_ally = is_same_side(_square.piece)
	return _square != square and ((difference.x == difference.y) or (square.coordinate.x == _square.coordinate.x or square.coordinate.y == _square.coordinate.y) or (difference.x <= 1 and difference.y <= 1)) and not has_ally
