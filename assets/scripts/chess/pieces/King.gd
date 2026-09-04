extends ChessPiece
class_name King

func interactable_squares() -> Array[ChessSquare]:
	return []

func interact_square(_square: ChessSquare) -> void:
	return

func in_checkmate() -> bool:
	var movements: Array[ChessSquare] = interactable_squares()
	var enemy_pieces: Array[ChessPiece] = ChessMatch.chess_match.get_oppenent_by_side(chess_side).get_pieces_in_board()
	var dont_have_movements: bool = false
	for i in enemy_pieces:
		movements = movements.filter(func(s: ChessSquare): return s not in i.interactable_squares())
		dont_have_movements = movements.is_empty()
		if dont_have_movements:
			break
	return dont_have_movements
