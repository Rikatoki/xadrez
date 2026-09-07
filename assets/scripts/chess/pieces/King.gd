extends ChessPiece
class_name King

func _get_piece_name() -> StringName:
	return &"King"

func interact_square(_square: ChessSquare) -> void:
	if _square.has_piece():
		Chessboard.remove_piece(_square.piece)
	Chessboard.move_piece(self, _square)
	return

func in_checkmate() -> bool:
	var movements: Array[ChessSquare] = _filter_squares_in_check(get_movements()) 
	var checkmate: bool = false
	var can_save: bool = false
	var checks: Array[ChessPiece] = check_by
	if checks.size() == 1:
		can_save = checks[0].check_by.size() != 0
	if movements.is_empty() and (checks.size() > 1 or not can_save):
		checkmate = true
	return checkmate

func _can_move(_square: ChessSquare) -> bool:
	var distance: Vector2i = (_square.coordinate - square.coordinate).abs()
	var has_ally_piece: bool = false
	if _square.has_piece():
		has_ally_piece = is_same_side(_square.piece)
	return _square != square and (distance.x <= 1 and distance.y <= 1) and not has_ally_piece

func _filter_squares_in_check(_squares: Array[ChessSquare]) -> Array[ChessSquare]:
	var enemy_pieces: Array[ChessPiece] = ChessMatch.chess_match.get_oppenent_by_side(chess_side).get_pieces_in_board()
	var squares_filtered: Array[ChessSquare] = _squares
	for i in enemy_pieces:
		squares_filtered = squares_filtered.filter(func(p: ChessSquare): return p in i.get_movements())
	return squares_filtered
