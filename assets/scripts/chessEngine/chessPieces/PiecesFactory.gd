extends RefCounted
class_name ChessPieceFactory


func white_initial_pieces() -> Array[ChessPiece]:
	var pieces: Array[ChessPiece]
	pieces.append_array([
		_add_piece(Rook.new(), Vector2i(1,1)),
		_add_piece(Knight.new(), Vector2i(1,2)),
		_add_piece(Bishop.new(), Vector2i(1,3)),
		_add_piece(Queen.new(), Vector2i(1,4)),
		_add_piece(King.new(), Vector2i(1,5)),
		_add_piece(Bishop.new(), Vector2i(1,6)),
		_add_piece(Knight.new(), Vector2i(1,7)),
		_add_piece(Rook.new(), Vector2i(1,8))
	])
	for i in range(1, 9):
		pieces.append(_add_piece(Pawn.new(), Vector2i(2,i)))
	return pieces


func black_initial_pieces() -> Array[ChessPiece]:
	var pieces: Array[ChessPiece]
	pieces.append_array([
		_add_piece(Rook.new(), Vector2i(8,1)),
		_add_piece(Knight.new(), Vector2i(8,2)),
		_add_piece(Bishop.new(), Vector2i(8,3)),
		_add_piece(Queen.new(), Vector2i(8,4)),
		_add_piece(King.new(), Vector2i(8,5)),
		_add_piece(Bishop.new(), Vector2i(8,6)),
		_add_piece(Knight.new(), Vector2i(8,7)),
		_add_piece(Rook.new(), Vector2i(8,8))
	])
	for i in range(1, 9):
		pieces.append(_add_piece(Pawn.new(), Vector2i(7,i)))
	return pieces


func _add_piece(piece: ChessPiece, coordinate: Vector2i) -> ChessPiece:
	ChessEngine.instance.chessboard.move_piece(piece, coordinate)
	return piece
