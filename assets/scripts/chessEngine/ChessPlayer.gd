extends Object
class_name ChessPlayer

var player_team: ChessEnums.ChessTeam

var player_pieces: Array[ChessPiece]

var king: King

## Esta classe deve ser substituída para implementar a lógica de rodada do jogador.
func play_turn(_engine: ChessEngine) -> void:
	var board: Chessboard = _engine.chessboard
	var pieces_can_move: Array[ChessPiece] = get_pieces_on_board().filter(func (piece: ChessPiece): return not piece.get_movements().is_empty())
	if not pieces_can_move:
		king.set_coordinate(Vector2i.ZERO)
		return
	var ramdom_piece: ChessPiece = pieces_can_move.pick_random()
	board.move_piece(ramdom_piece, ramdom_piece.get_movements().pick_random())


func get_pieces_on_board() -> Array[ChessPiece]:
	var pieces: Array[ChessPiece] = []
	for piece in player_pieces:
		if piece.on_board():
			pieces.append(piece)
	return pieces


func set_player_team(team: ChessEnums.ChessTeam) -> ChessPlayer:
	player_team = team
	return self


func set_player_pieces(pieces: Array[ChessPiece]) -> ChessPlayer:
	for piece in pieces:
		_set_piece_team(piece)
		if piece is King:
			king = piece
	player_pieces = pieces
	return self


func append_piece(piece: ChessPiece) -> ChessPlayer:
	if player_pieces == null:
		player_pieces = []
	_set_piece_team(piece)
	if piece is King:
		king = piece
	player_pieces.append(piece)
	return self


func _set_piece_team(piece: ChessPiece) -> ChessPlayer:
	piece.piece_team = player_team
	return self


func remove_piece(piece: ChessPiece) -> ChessPlayer:
	if player_pieces != null:
		player_pieces.erase(piece)
	return self
