extends Object
class_name ChessMatch

enum States{
	IDLE,
	NEW_GAME,
	WHITE_TURN,
	BLACK_TURN,
	END_TURN,
	VICTORY,
	DRAW
}

var state: States
var rules: ChessRules
var entity_white: ChessEntity
var entity_black: ChessEntity
var board: Chessboard

func _init() -> void:
	state = States.IDLE
	board = Chessboard.new()
	rules = ChessRules.new()

func new_game(white: ChessEntity, black: ChessEntity) -> void:
	if !white or !black:
			return push_error("Para iniciar um jogo é necessário ter entidade de ambos os lados. \nWhite: " + str(white) + "\nBlack: " + str(black))
	if state == States.IDLE:
		white.chess_side = GAME_VARIABLES.ChessSide.WHITE
		black.chess_side = GAME_VARIABLES.ChessSide.BLACK
		entity_white = white
		entity_black = black
		entity_white.entity_pieces = _white_initial_pieces()
		entity_black.entity_pieces = _black_initial_pieces()
		state = States.NEW_GAME
		white_turn()

func white_turn() -> void:
	if state in [States.NEW_GAME, States.END_TURN]:
		state = States.WHITE_TURN
		entity_white.play_round()
		end_turn()

func black_turn() -> void:
	if state == States.END_TURN:
		state = States.BLACK_TURN
		entity_black.play_round()
		end_turn()

func end_turn() -> void: # Verifica regras com GameRules
	if state in [States.WHITE_TURN, States.BLACK_TURN]:
		var last_turn: States = state 
		rules.set_pieces(entity_white.get_pieces_in_board(), entity_black.get_pieces_in_board())
		# Código...
		
		state = States.END_TURN
		if last_turn == States.WHITE_TURN:
			black_turn()
		elif last_turn == States.BLACK_TURN:
			white_turn()

func victory(winner: ChessEntity) -> void:
	if state == States.END_TURN:
		# Código...
		state = States.VICTORY

func draw() -> void:
	if state == States.END_TURN:
		# Código...
		state = States.DRAW

func _white_initial_pieces() -> Array[ChessPiece]:
	var pieces: Array[ChessPiece] = []
	 
	return pieces

func _black_initial_pieces() -> Array[ChessPiece]:
	var pieces: Array[ChessPiece] = []
	 
	return pieces
