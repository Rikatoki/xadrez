extends Object
class_name ChessMatch

static var chess_match: ChessMatch
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
	chess_match = self
	state = States.IDLE
	board = Chessboard.new()
	rules = ChessRules.new()

func new_game(white: ChessEntity, black: ChessEntity) -> void:
	if !white or !black:
			return push_error("Para iniciar um jogo é necessário ter entidade de ambos os lados. \nWhite: " + str(white) + "\nBlack: " + str(black))
	if state == States.IDLE:
		entity_white = white
		entity_black = black
		white.set_pieces(_white_initial_pieces()).set_side(GAME_VARIABLES.ChessSide.WHITE)
		black.set_pieces(_black_initial_pieces()).set_side(GAME_VARIABLES.ChessSide.BLACK)
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

func get_entity_by_side(side: GameVariables.ChessSide) -> ChessEntity:
	return entity_white if side == GAME_VARIABLES.ChessSide.WHITE else entity_black

func get_oppenent_by_side(side: GameVariables.ChessSide) -> ChessEntity:
	return entity_white if side == GAME_VARIABLES.ChessSide.BLACK else entity_black

func _white_initial_pieces() -> Array[ChessPiece]:
	var pieces: Array[ChessPiece] = []
	 
	return pieces

func _black_initial_pieces() -> Array[ChessPiece]:
	var pieces: Array[ChessPiece] = []
	 
	return pieces
