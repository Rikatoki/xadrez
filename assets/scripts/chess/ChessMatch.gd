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
var _report: ChessReport

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
		state = States.END_TURN
		if rules.is_victory():
			var winner: ChessEntity = entity_white if rules.side_winner == GameVariables.ChessSide.WHITE else entity_black
			victory(winner)
		elif rules.is_draw():
			draw()
		elif last_turn == States.WHITE_TURN:
			black_turn()
		elif last_turn == States.BLACK_TURN:
			white_turn()

func victory(winner: ChessEntity) -> void:
	if state == States.END_TURN:
		_report = ChessReport.new(ChessReport.EndTypes.VICTORY)
		_report.winner = winner
		state = States.VICTORY

func draw() -> void:
	if state == States.END_TURN:
		_report = ChessReport.new(ChessReport.EndTypes.DRAW)
		state = States.DRAW

func get_report() -> ChessReport:
	if state in [States.VICTORY, States.DRAW]:
		return _report
	return null

func get_entity_by_side(side: GameVariables.ChessSide) -> ChessEntity:
	return entity_white if side == GAME_VARIABLES.ChessSide.WHITE else entity_black

func get_oppenent_by_side(side: GameVariables.ChessSide) -> ChessEntity:
	return entity_white if side == GAME_VARIABLES.ChessSide.BLACK else entity_black

func _white_initial_pieces() -> Array[ChessPiece]:
	var pieces: Array[ChessPiece] = []
	var white: GameVariables.ChessSide = GameVariables.ChessSide.WHITE
	pieces.append(Rook.new(board.get_square_by_coordinate(Vector2i(1,1)), white))
	pieces.append(Knight.new(board.get_square_by_coordinate(Vector2i(1,2)), white))
	pieces.append(Bishop.new(board.get_square_by_coordinate(Vector2i(1,3)), white))
	pieces.append(Queen.new(board.get_square_by_coordinate(Vector2i(1,4)), white))
	pieces.append(King.new(board.get_square_by_coordinate(Vector2i(1,5)), white))
	pieces.append(Bishop.new(board.get_square_by_coordinate(Vector2i(1,6)), white))
	pieces.append(Knight.new(board.get_square_by_coordinate(Vector2i(1,7)), white))
	pieces.append(Rook.new(board.get_square_by_coordinate(Vector2i(1,8)), white))
	for i in range(1, 9):
		pieces.append(Pawn.new(board.get_square_by_coordinate(Vector2i(2,i)), white))
	return pieces

func _black_initial_pieces() -> Array[ChessPiece]:
	var pieces: Array[ChessPiece] = []
	var black: GameVariables.ChessSide = GameVariables.ChessSide.WHITE
	pieces.append(Rook.new(board.get_square_by_coordinate(Vector2i(8,1)), black))
	pieces.append(Knight.new(board.get_square_by_coordinate(Vector2i(8,2)), black))
	pieces.append(Bishop.new(board.get_square_by_coordinate(Vector2i(8,3)), black))
	pieces.append(Queen.new(board.get_square_by_coordinate(Vector2i(8,4)), black))
	pieces.append(King.new(board.get_square_by_coordinate(Vector2i(8,5)), black))
	pieces.append(Bishop.new(board.get_square_by_coordinate(Vector2i(8,6)), black))
	pieces.append(Knight.new(board.get_square_by_coordinate(Vector2i(8,7)), black))
	pieces.append(Rook.new(board.get_square_by_coordinate(Vector2i(8,8)), black))
	for i in range(1, 9):
		pieces.append(Pawn.new(board.get_square_by_coordinate(Vector2i(7,i)), black))
	return pieces
