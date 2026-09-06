extends ChessPiece
class_name Pawn

var _has_moved: bool = false

func interact_square(_square: ChessSquare) -> void:
	_has_moved = true
	return

func _can_move(_square: ChessSquare) -> bool:
	var difference: Vector2i = _square.coordinate - square.coordinate
	var can_move: bool = false
	var cases: int = 2 if not _has_moved else 1
	var has_ally: bool = false
	if chess_side == GameVariables.ChessSide.WHITE:
		can_move = difference.x <= cases and difference.x > 0
	elif chess_side == GameVariables.ChessSide.BLACK:
		can_move = difference.x >= (cases * -1) and difference.x < 0
	if _square.has_piece():
		has_ally = is_same_side(_square.piece)
	return can_move and not has_ally
