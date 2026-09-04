extends Object
class_name ChessRules

var black_pieces: Array[ChessPiece]
var white_pieces: Array[ChessPiece]
var _side_winner: GameVariables.ChessSide

func is_victory() -> bool:
	var victory: bool = false
	var white_king: King = _get_white_king()
	var black_king: King = _get_black_king()
	
	if white_king == null or black_king == null:
		_side_winner = GAME_VARIABLES.ChessSide.WHITE if white_king == null else GAME_VARIABLES.ChessSide.BLACK
		victory = true
	elif black_king.in_checkmate():
		_side_winner = GAME_VARIABLES.ChessSide.WHITE
		victory = true
	elif white_king.in_checkmate():
		_side_winner = GAME_VARIABLES.ChessSide.BLACK
		victory = true
	return victory

func is_draw() -> bool:
	return true

func set_pieces(_white_pieces: Array[ChessPiece], _black_pieces: Array[ChessPiece]) -> void:
	white_pieces = _white_pieces
	black_pieces = _black_pieces

func _get_white_king() -> King:
	for n in white_pieces:
		if n is King:
			return n
	return null

func _get_black_king() -> King:
	for n in black_pieces:
		if n is King:
			return n
	return null
