## Composto por todos os elementos envolvendo o jogo do xadrez, esta classe é o coração do jogo.
## V0.1 Beta
extends Object
class_name ChessEngine

enum States{
	IDLE,
	NEW_GAME,
	WHITE_TURN,
	BLACK_TURN,
	VICTORY,
	DRAW
}

static var instance: ChessEngine

var state: States = States.IDLE

var chessboard: Chessboard = Chessboard.new()

var piece_factory: ChessPieceFactory = ChessPieceFactory.new()

var white_player: ChessPlayer

var black_player: ChessPlayer

var winner: ChessPlayer

func _init() -> void:
	instance = self

## Inicia o [ChessEngine] para iniciar um novo jogo.
func new_game(white: ChessPlayer, black: ChessPlayer) -> ChessEngine:
	if state != States.IDLE:
		push_warning("Erro: Não é possível iniciar o jogo se ele já foi iniciado.")
		return self
	_setup_players(white, black)
	state = States.WHITE_TURN
	
	next_turn()
	return self


func next_turn() -> void:
	print(self)
	if _game_ended():
		return
	var current_turn: ChessPlayer
	var next_state: States
	if state == States.WHITE_TURN:
		current_turn = white_player
		next_state = States.BLACK_TURN
	elif state == States.BLACK_TURN:
		current_turn = black_player
		next_state = States.WHITE_TURN
	else:
		return
	
	current_turn.play_turn(self)
	# Após a rodada acabar...
	state = next_state
	
	next_turn()


func _game_ended() -> bool:
	# Verifica as regras e muda o estado de acordo. [Victory, draw]
	var rules: ChessRules = ChessRules.new(white_player, black_player)
	if rules.is_checkmate(chessboard):
		_victory(rules.winner)
		return true
	elif rules.is_draw():
		_draw()
		return true
	return false

func _victory(_winner: ChessPlayer) -> void:
	state = States.VICTORY
	winner = _winner
	pass

func _draw() -> void:
	state = States.DRAW
	return


func _setup_players(white: ChessPlayer, black: ChessPlayer) -> void:
	white_player = white.set_player_team(ChessEnums.ChessTeam.WHITE)
	white_player.set_player_pieces(piece_factory.white_initial_pieces())
	black_player = black.set_player_team(ChessEnums.ChessTeam.BLACK)
	black_player.set_player_pieces(piece_factory.black_initial_pieces())

## Sobrescreva para adicionar peças inciais customizadas.
func set_piece_factory(factory: ChessPieceFactory) -> void:
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
