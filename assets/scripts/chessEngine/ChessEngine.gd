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
			_create_rook(Vector2i(1,1)),
			_create_knight(Vector2i(1,2)),
			_create_bishop(Vector2i(1,3)),
			_create_queen(Vector2i(1,4)),
			_create_king(Vector2i(1,5)),
			_create_bishop(Vector2i(1,6)),
			_create_knight(Vector2i(1,7)),
			_create_rook(Vector2i(1,8))
		])
		for i in range(1, 9):
			pieces.append(_create_pawn(Vector2i(2,i)))
		return pieces
	
	func black_initial_pieces() -> Array[ChessBasePiece]:
		var pieces: Array[ChessBasePiece]
		pieces.append_array([
			_create_rook(Vector2i(8,1)),
			_create_knight(Vector2i(8,2)),
			_create_bishop(Vector2i(8,3)),
			_create_queen(Vector2i(8,4)),
			_create_king(Vector2i(8,5)),
			_create_bishop(Vector2i(8,6)),
			_create_knight(Vector2i(8,7)),
			_create_rook(Vector2i(8,8))
		])
		for i in range(1, 9):
			pieces.append(_create_pawn(Vector2i(7,i)))
		return pieces
	
	func _create_pawn(coordinate: Vector2i) -> Pawn:
		var pawn: Pawn = Pawn.new()
		ChessEngine.instance.chessboard.move_piece(pawn, coordinate)
		return pawn
	
	func _create_bishop(coordinate: Vector2i) -> Bishop:
		var bishop: Bishop = Bishop.new()
		ChessEngine.instance.chessboard.move_piece(bishop, coordinate)
		return bishop
	
	func _create_knight(coordinate: Vector2i) -> Knight:
		var knight: Knight = Knight.new()
		ChessEngine.instance.chessboard.move_piece(knight, coordinate)
		return knight
	
	func _create_rook(coordinate: Vector2i) -> Rook:
		var rook: Rook = Rook.new()
		ChessEngine.instance.chessboard.move_piece(rook, coordinate)
		return rook
	
	func _create_king(coordinate: Vector2i) -> King:
		var king: King = King.new()
		ChessEngine.instance.chessboard.move_piece(king, coordinate)
		return king
	
	func _create_queen(coordinate: Vector2i) -> Queen:
		var queen: Queen = Queen.new()
		ChessEngine.instance.chessboard.move_piece(queen, coordinate)
		return queen
