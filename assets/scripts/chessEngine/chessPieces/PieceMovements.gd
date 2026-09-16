extends RefCounted
class_name PieceMovements

var piece_side: ChessEnums.ChessTeam
var chessboard: Chessboard

func _init(side: ChessEnums.ChessTeam, board: Chessboard = ChessEngine.instance.chessboard) -> void:
	piece_side = side
	chessboard = board

# Movimento de cruz.
func cross_move(from: Vector2i) -> Array[Vector2i]:
	var moves: Array[Vector2i] = []
	var can_u: bool = true
	var can_l: bool = true
	var can_r: bool = true
	var can_b: bool = true
	for i in range(1, ChessVariables.COLUMNS + 1):
		if can_u:
			var upper: Vector2i = Vector2i(from.x, from.y + i)
			_add_move(moves, upper)
			can_u = _can_continue(upper)
		if can_l:
			var left: Vector2i = Vector2i(from.x - i, from.y)
			_add_move(moves, left)
			can_l = _can_continue(left)
		if can_r:
			var right: Vector2i = Vector2i(from.x + i, from.y)
			_add_move(moves, right)
			can_r = _can_continue(right)
		if can_b:
			var bottom: Vector2i = Vector2i(from.x, from.y - i)
			_add_move(moves, bottom)
			can_b = _can_continue(bottom)
	return moves

# Movimento diagonal
func diagonal_move(from: Vector2i) -> Array[Vector2i]:
	var moves: Array[Vector2i] = []
	var can_ul: bool = true
	var can_ur: bool = true
	var can_bl: bool = true
	var can_br: bool = true
	for i in range(1, ChessVariables.COLUMNS + 1):
		if can_ul:
			var upper_left: Vector2i = Vector2i(from.x - i, from.y + i)
			_add_move(moves, upper_left)
			can_ul = _can_continue(upper_left)
		if can_ur:
			var upper_right: Vector2i = Vector2i(from.x + i, from.y + i)
			_add_move(moves, upper_right)
			can_ur = _can_continue(upper_right)
		if can_bl:
			var bottom_left: Vector2i = Vector2i(from.x - i, from.y - i)
			_add_move(moves, bottom_left)
			can_bl = _can_continue(bottom_left)
		if can_br:
			var bottom_right: Vector2i = Vector2i(from.x + i, from.y - i)
			_add_move(moves, bottom_right)
			can_br = _can_continue((bottom_right))
	return moves 

# Movimento ao redor do from.
func around_move(from: Vector2i) -> Array[Vector2i]:
	var moves: Array[Vector2i] = []
	_add_move(moves, Vector2i(from.x, from.y + 1))
	_add_move(moves, Vector2i(from.x + 1, from.y + 1))
	_add_move(moves, Vector2i(from.x - 1, from.y + 1))
	_add_move(moves, Vector2i(from.x + 1, from.y))
	_add_move(moves, Vector2i(from.x - 1, from.y))
	_add_move(moves, Vector2i(from.x, from.y - 1))
	_add_move(moves, Vector2i(from.x - 1, from.y - 1))
	_add_move(moves, Vector2i(from.x + 1, from.y - 1))
	return moves


func knight_move(from: Vector2i) -> Array[Vector2i]:
	var moves: Array[Vector2i] = []
	_add_move(moves, Vector2i(from.x + 2, from.y + 1))
	_add_move(moves, Vector2i(from.x + 2, from.y - 1))
	_add_move(moves, Vector2i(from.x - 2, from.y + 1))
	_add_move(moves, Vector2i(from.x - 2, from.y - 1))
	_add_move(moves, Vector2i(from.x + 1, from.y + 2))
	_add_move(moves, Vector2i(from.x - 1, from.y + 2))
	_add_move(moves, Vector2i(from.x + 1, from.y - 2))
	_add_move(moves, Vector2i(from.x - 1, from.y - 2))
	return moves


func pawn_move(from: Vector2i, times: int = 1) -> Array[Vector2i]:
	var moves: Array[Vector2i] = []
	var direction: int = 1 if piece_side == GameVariables.ChessSide.WHITE else -1
	var diagonal_l: Vector2i = Vector2i(from.x + 1 * direction, from.y - 1)
	var diagonal_r: Vector2i = Vector2i(from.x + 1 * direction, from.y + 1)
	for i in range(1, times + 1):
		var move = Vector2i(from.x + i * direction, from.y)
		if _can_continue(move):
			moves.append(move)
	if chessboard.is_valid_coordinate(diagonal_l):
		var piece: ChessPiece = chessboard.get_piece_by_coordinate(diagonal_l)
		if piece != null and not piece.is_same_side(piece_side):
			moves.append(diagonal_l)
	if chessboard.is_valid_coordinate(diagonal_r):
		var piece: ChessPiece = chessboard.get_piece_by_coordinate(diagonal_r)
		if piece != null and not piece.is_same_side(piece_side):
			moves.append(diagonal_r)
	return moves


func _add_move(moves: Array, move: Vector2i) -> void:
	if _valid_move(move):
		moves.append(move)

# Centralização da regra de validação de um quadrado
func _valid_move(coord: Vector2i) -> bool:
	var piece_in_coord: ChessPiece = chessboard.get_piece_by_coordinate(coord)
	return chessboard.is_valid_coordinate(coord) and (piece_in_coord == null or not piece_in_coord.is_same_side(piece_side))

func _can_continue(coord: Vector2i) -> bool:
	return chessboard.is_valid_coordinate(coord) and not chessboard.has_piece(coord)
