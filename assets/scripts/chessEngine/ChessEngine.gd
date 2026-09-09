## Composto por todos os elementos envolvendo o jogo do xadrez, esta classe é o coração do jogo.
extends Object
class_name ChessEngine

static var instance: ChessEngine

var chessboard: Chessboard = Chessboard.new()

var white_player: ChessBasePlayer

var black_player: ChessBasePlayer

func _init() -> void:
	instance = self

## Para testes.
func _to_string() -> String:
	var chess_str: String = ""
	if white_player != null or black_player != null:
		var players_str: String = "Players: \nWhite -> {0}\nBlack -> {1}".format([white_player, black_player])
		chess_str += players_str + "\n"
	if chessboard != null:
		var board_str: String = "Chessboard: \n" + str(chessboard)
		chess_str += board_str + "\n"
	return chess_str

## Inicia o [ChessEngine] para iniciar um novo jogo.
func new_game(white: ChessBasePlayer, black: ChessBasePlayer) -> ChessEngine:
	setup_players(white, black)
	
	return self


func setup_players(white: ChessBasePlayer, black: ChessBasePlayer) -> void:
	var initial_pieces: ChessInitialPieces = ChessInitialPieces.new()
	white_player = white.set_player_team(ChessEnums.ChessTeam.WHITE)
	white_player.set_player_pieces(initial_pieces.white_initial_pieces())
	black_player = black.set_player_team(ChessEnums.ChessTeam.BLACK)
	black_player.set_player_pieces(initial_pieces.black_initial_pieces())


class ChessInitialPieces:
	func white_initial_pieces() -> Array[ChessBasePiece]:
		var pieces: Array[ChessBasePiece]
		pieces.append_array([
			_add_piece(Rook.new(), Vector2i(1,1)),
			_add_piece(Knight.new(), Vector2i(1,2)),
			_add_piece(Bishop.new(), Vector2i(1,3)),
			_add_piece(Queen.new(), Vector2i(1,4)),
			_add_piece(King.new(), Vector2i(1,5)),
			_add_piece(Bishop.new(), Vector2i(1,6)),
			_add_piece(Knight.new(), Vector2i(1,7)),
			_add_piece(Rook.new(), Vector2i(1,8))
		])
		for i in range(1, 9):
			pieces.append(_add_piece(Pawn.new(), Vector2i(2,i)))
		return pieces
	
	func black_initial_pieces() -> Array[ChessBasePiece]:
		var pieces: Array[ChessBasePiece]
		pieces.append_array([
			_add_piece(Rook.new(), Vector2i(8,1)),
			_add_piece(Knight.new(), Vector2i(8,2)),
			_add_piece(Bishop.new(), Vector2i(8,3)),
			_add_piece(Queen.new(), Vector2i(8,4)),
			_add_piece(King.new(), Vector2i(8,5)),
			_add_piece(Bishop.new(), Vector2i(8,6)),
			_add_piece(Knight.new(), Vector2i(8,7)),
			_add_piece(Rook.new(), Vector2i(8,8))
		])
		for i in range(1, 9):
			pieces.append(_add_piece(Pawn.new(), Vector2i(7,i)))
		return pieces
	
	func _add_piece(piece: ChessBasePiece, coordinate: Vector2i) -> ChessBasePiece:
		ChessEngine.instance.chessboard.move_piece(piece, coordinate)
		return piece
	
