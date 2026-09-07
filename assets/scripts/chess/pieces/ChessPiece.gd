@abstract
extends Object
class_name ChessPiece

var piece_name: StringName

var square: ChessSquare

var chess_side: GameVariables.ChessSide

var _movements: Movements

var check_by: Array[ChessPiece]:
	get = get_check_by

func _init(_square: ChessSquare, side: GameVariables.ChessSide) -> void:
	square = _square
	chess_side = side
	piece_name = _get_piece_name()

func get_movements() -> Array[ChessSquare]:
	var movements: Array[ChessSquare] = []
	for i in square.chessboard.chess_squares:
		if _can_move(i):
			movements.append(i)
	return movements

func _get_piece_name() -> StringName:
	return &""

@abstract
func interact_square(_square: ChessSquare) -> void

@abstract
func _can_move(_square) -> bool

func get_check_by() -> Array[ChessPiece]:
	var enemy_pieces: Array[ChessPiece] =  ChessMatch.chess_match.get_oppenent_by_side(chess_side).get_pieces_in_board()
	return enemy_pieces.filter(func(p: ChessPiece): return square in p.get_movements())

func in_square() -> bool:
	return square != null

func get_side() -> GameVariables.ChessSide:
	return chess_side

func is_same_side(_piece: ChessPiece) -> bool:
	return _piece.chess_side == chess_side

## Classe que lidará com os tipos de movimentações de cada peça.
class Movements: 
	func _init() -> void:
		pass
	pass
