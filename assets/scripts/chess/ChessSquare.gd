extends Object
class_name ChessSquare

var chessboard: Chessboard
var coordinate: Vector2i
var piece: ChessPiece

func _init(_chessboard: Chessboard, _coordinate: Vector2i, _piece = null) -> void:
	chessboard = _chessboard
	coordinate = _coordinate
	piece = _piece

func has_piece() -> bool:
	return piece != null
