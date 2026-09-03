@abstract
extends Object
class_name ChessPiece

var square: ChessSquare

var chess_side: GameVariables.ChessSide

func _init(_square: ChessSquare, side: GameVariables.ChessSide) -> void:
	square = _square
	chess_side = side

@abstract
func interactable_squares() -> Array[ChessSquare]

@abstract
func interact_square(_square: ChessSquare) -> void

func in_square() -> bool:
	return square != null

func get_side() -> GameVariables.ChessSide:
	return chess_side
