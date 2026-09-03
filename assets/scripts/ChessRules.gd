extends Object
class_name ChessRules

var black_pieces: Array[ChessPiece]
var white_pieces: Array[ChessPiece]

func set_pieces(_white_pieces: Array[ChessPiece], _black_pieces: Array[ChessPiece]) -> void:
	white_pieces = _white_pieces
	black_pieces = _black_pieces
