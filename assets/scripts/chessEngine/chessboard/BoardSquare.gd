extends RefCounted
class_name BoardSquare


var coordinate: Vector2i
var piece_in_square: ChessBasePiece


func _init(_coordinate: Vector2i) -> void:
	coordinate = _coordinate


func has_piece() -> bool:
	return piece_in_square != null

## Para testes.
func _to_string() -> String:
	var square_str: String = "["
	if has_piece():
		square_str += str(piece_in_square)
	else:
		square_str += "  "
	square_str += "]"
	return square_str
