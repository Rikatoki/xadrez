extends Sprite2D
class_name TablePiece

var _piece_ref: ChessPiece
var _image_path: String

func _init(piece: ChessPiece) -> void:
	_piece_ref = piece
	var chess_side: String = "W" if piece.chess_side == GameVariables.ChessSide.WHITE else "B"
	_image_path = "res://assets/sprites/16x32 pieces/{side}_{piece}.png".format({
		"side": chess_side, 
		"piece": piece.piece_name
	})

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = load(_image_path)

func get_piece() -> ChessPiece:
	return _piece_ref
