## Composto por todos os elementos envolvendo o jogo do xadrez, esta classe é o coração do jogo.
extends Object
class_name ChessEngine

static var instance: ChessEngine

var chessboard: Chessboard = Chessboard.new()

var piece_factory: ChessPieceFactory = ChessPieceFactory.new()

var white_player: ChessPlayer

var black_player: ChessPlayer

# É preciso criar a variável que determina qual é o turno atual.

func _init() -> void:
	instance = self

## Inicia o [ChessEngine] para iniciar um novo jogo.
func new_game(white: ChessPlayer, black: ChessPlayer) -> ChessEngine:
	_setup_players(white, black)
	return self


func next_turn() -> void:
	return


func _setup_players(white: ChessPlayer, black: ChessPlayer) -> void:
	white_player = white.set_player_team(ChessEnums.ChessTeam.WHITE)
	white_player.set_player_pieces(piece_factory.white_initial_pieces())
	black_player = black.set_player_team(ChessEnums.ChessTeam.BLACK)
	black_player.set_player_pieces(piece_factory.black_initial_pieces())

## Sobrescreva para adicionar peças inciais customizadas.
func _set_piece_factory(factory: ChessPieceFactory) -> void:
	piece_factory = factory

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
