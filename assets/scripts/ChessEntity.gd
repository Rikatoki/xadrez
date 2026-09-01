@abstract
extends Object
class_name ChessEntity

var entity_pieces: Array[ChessPiece]

func _init(_pieces: Array[ChessPiece]) -> void:
	entity_pieces = _pieces
	if entity_pieces == null:
		entity_pieces = []

@abstract
func play_round() -> void

func get_pieces_in_board() -> Array[ChessPiece]:
	var pieces_in_board: Array[ChessPiece] = entity_pieces.filter(func(i: ChessPiece): return i.in_square())
	return pieces_in_board

func get_pieces_not_in_board() -> Array[ChessPiece]:
	var pieces_not_in_board: Array[ChessPiece] = entity_pieces.filter(func(i: ChessPiece): return not i.in_square())
	return pieces_not_in_board
