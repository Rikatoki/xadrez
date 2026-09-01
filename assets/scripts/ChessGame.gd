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
	
func white_turn() -> void:
	pass

func black_turn() -> void:
	pass

func end_turn() -> void:
	pass

func victory(winner: ChessEntity) -> void:
	pass

func draw() -> void:
	pass
