extends Object
class_name ChessGame

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
	rules = ChessRules.new(board)

func new_game(white: ChessEntity, black: ChessEntity) -> void:
	if !white or !black:
			return push_error("Para iniciar um jogo é necessário ter entidade de ambos os lados. \nWhite: " + str(white) + "\nBlack: " + str(black))
	if state == States.IDLE:
		state = States.NEW_GAME
		entity_white = white
		entity_black = black
		entity_white.entity_pieces = _white_initial_pieces()
		entity_black.entity_pieces = _black_initial_pieces()

func _white_initial_pieces() -> Array[ChessPiece]:
	var pieces: Array[ChessPiece] = []
	 
	return pieces

func _black_initial_pieces() -> Array[ChessPiece]:
	var pieces: Array[ChessPiece] = []
	 
	return pieces

func white_turn() -> void:
	entity_white.play_round()

func black_turn() -> void:
	entity_black.play_round()

func end_turn() -> void: # Verifica regras com GameRules
	pass

func victory(winner: ChessEntity) -> void:
	pass

func draw() -> void:
	pass
