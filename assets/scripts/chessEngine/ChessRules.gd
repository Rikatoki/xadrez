extends Object
class_name ChessRules

var _white_player: ChessPlayer
var _black_player: ChessPlayer

var winner: ChessPlayer

func _init(white: ChessPlayer, black: ChessPlayer) -> void:
	_white_player = white
	_black_player = black

func is_checkmate(_board: Chessboard) -> bool:
	var checkmate: bool = false
	var w_king: King = _white_player.king
	var b_king: King = _black_player.king
	
	if w_king == null or w_king.piece_coordinate in [Vector2i.ZERO, null]:
		winner = _black_player
		checkmate = true
	elif b_king == null or b_king.piece_coordinate in [Vector2i.ZERO, null]:
		winner = _white_player
		checkmate = true
	
	return checkmate

func is_draw() -> bool:
	var white_pieces: Array = _white_player.get_pieces_on_board()
	var black_pieces: Array = _black_player.get_pieces_on_board()
	return white_pieces.size() <= 2 and black_pieces.size() <= 2
