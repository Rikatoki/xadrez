extends RefCounted
class_name PieceMovements

var piece_side: ChessEnums.ChessTeam
var chessboard: Chessboard = ChessEngine.instance.chessboard

func _init(side: ChessEnums.ChessTeam) -> void:
	piece_side = side

func cross_move(from: Vector2i) -> Array[Vector2i]:
	var moves: Array[Vector2i] = []
	var can_ul: bool = true
	var can_ur: bool = true
	for i in range(1, ChessVariables.COLUMNS + 1):
		if can_ul:
			var upper_left: Vector2i = Vector2i(from.x - i, from.y + i)
			if _valid_move(upper_left):
				moves.append(upper_left)
			can_ul = _can_continue(upper_left)
		if can_ur:
			pass
	return moves

func x_move(from: Vector2i) -> Array[Vector2i]:
	var moves: Array[Vector2i] = []
	return moves

func around_move(from: Vector2i) -> Array[Vector2i]:
	var moves: Array[Vector2i] = []
	return moves

# Centralização da regra de validação de um quadrado
func _valid_move(coord: Vector2i) -> bool:
	var is_valid: bool = false
	if chessboard.is_valid_coordinate(coord):
		var square: BoardSquare = chessboard.get_square_by_coordinate(coord)
		is_valid = not square.has_piece() or not square.piece_in_square.is_same_side(piece_side)
	return is_valid

func _can_continue(coord: Vector2i) -> bool:
	return chessboard.is_valid_coordinate(coord) and not chessboard.get_square_by_coordinate(coord).has_piece()
