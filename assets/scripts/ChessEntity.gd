@abstract
extends Object
class_name ChessEntity

var entity_pieces: Array[ChessPiece]
var chess_side: GameVariables.ChessSide

@abstract
func play_round() -> void

func get_pieces_in_board() -> Array[ChessPiece]:
	var pieces_in_board: Array[ChessPiece] = entity_pieces.filter(func(i: ChessPiece): return i.in_square())
	return pieces_in_board

func get_pieces_not_in_board() -> Array[ChessPiece]:
	var pieces_not_in_board: Array[ChessPiece] = entity_pieces.filter(func(i: ChessPiece): return not i.in_square())
	return pieces_not_in_board
