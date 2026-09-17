extends RefCounted
class_name ChessPieceFactory


func white_initial_pieces() -> Array[ChessPiece]:
	var pieces: Array[ChessPiece]
	pieces.append_array([
		_add_piece(Rook.new(), Vector2i(1,1)),
		_add_piece(Knight.new(), Vector2i(2,1)),
		_add_piece(Bishop.new(), Vector2i(3,1)),
		_add_piece(Queen.new(), Vector2i(4,1)),
		_add_piece(King.new(), Vector2i(5,1)),
		_add_piece(Bishop.new(), Vector2i(6,1)),
		_add_piece(Knight.new(), Vector2i(7,1)),
		_add_piece(Rook.new(), Vector2i(8,1))
	])
	for i in range(1, 9):
		pieces.append(_add_piece(Pawn.new(), Vector2i(i,2)))
	return pieces


func black_initial_pieces() -> Array[ChessPiece]:
	var pieces: Array[ChessPiece]
	pieces.append_array([
		_add_piece(Rook.new(), Vector2i(1,8)),
		_add_piece(Knight.new(), Vector2i(2,8)),
		_add_piece(Bishop.new(), Vector2i(3,8)),
		_add_piece(Queen.new(), Vector2i(4,8)),
		_add_piece(King.new(), Vector2i(5,8)),
		_add_piece(Bishop.new(), Vector2i(6,8)),
		_add_piece(Knight.new(), Vector2i(7,8)),
		_add_piece(Rook.new(), Vector2i(8,8))
	])
	for i in range(1, 9):
		pieces.append(_add_piece(Pawn.new(), Vector2i(i,7)))
	return pieces


func _add_piece(piece: ChessPiece, coordinate: Vector2i) -> ChessPiece:
	ChessEngine.instance.chessboard.move_piece(piece, coordinate)
	return piece
