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
	white_player = white.set_player_team(ChessEnums.ChessTeam.WHITE)
	white_player.set_player_pieces(ChessInitialPieces.white_initial_pieces())
	black_player = black.set_player_team(ChessEnums.ChessTeam.BLACK)
	black_player.set_player_pieces(ChessInitialPieces.black_initial_pieces())


class ChessInitialPieces:
	static func white_initial_pieces() -> Array[ChessBasePiece]:
		var pieces: Array[ChessBasePiece]
		return pieces
	
	static func black_initial_pieces() -> Array[ChessBasePiece]:
		var pieces: Array[ChessBasePiece]
		return pieces
