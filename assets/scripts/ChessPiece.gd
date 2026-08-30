@abstract
extends Object
class_name ChessPiece

var square: ChessSquare

func _init(_square: ChessSquare) -> void:
	square = _square

@abstract
func interactable_squares() -> Array[ChessSquare]

@abstract
func interact_square(_square: ChessSquare) -> void

func in_square() -> bool:
	return square != null
