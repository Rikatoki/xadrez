extends Object
class_name ChessRules

var black_pieces: Array[ChessPiece]
var white_pieces: Array[ChessPiece]
var side_winner: GameVariables.ChessSide

func is_victory() -> bool:
	var victory: bool = false
	var white_king: King = _get_white_king()
	var black_king: King = _get_black_king()
	
	if white_king == null or black_king == null:
		side_winner = GAME_VARIABLES.ChessSide.WHITE if black_king == null else GAME_VARIABLES.ChessSide.BLACK
		victory = true
	elif black_king.in_checkmate():
		side_winner = GAME_VARIABLES.ChessSide.WHITE
		victory = true
	elif white_king.in_checkmate():
		side_winner = GAME_VARIABLES.ChessSide.BLACK
		victory = true
	return victory

func is_draw() -> bool:
	var draw: bool = false
	if white_pieces.size() == 1 and black_pieces.size() == 1:
		draw = true
	elif white_pieces.size() == 1 and black_pieces.size() == 2:
		for i in black_pieces:
			if i is Knight or i is Bishop:
				draw = true
				break
	elif white_pieces.size() == 2 and black_pieces.size() == 1:
		for i in white_pieces:
			if i is Knight or i is Bishop:
				draw = true
				break
	elif white_pieces.size() == 3 and black_pieces.size() == 1:
		var k_count: int = 0
		for i in white_pieces:
			if i is Knight:
				k_count += 1
				if k_count == 2:
					draw = true
	elif white_pieces.size() == 1 and black_pieces.size() == 3:
		var k_count: int = 0
		for i in black_pieces:
			if i is Knight:
				k_count += 1
				if k_count == 2:
					draw = true
	return draw

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
