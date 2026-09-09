extends Object
class_name Chessboard

var board: Array[BoardSquare]

const LINES: int = 8

const COLUMNS: int = 8


func _init() -> void:
	_create_board()


func _create_board() -> void:
	board = []
	for line in range(1, LINES + 1):
		for column in range(1, COLUMNS + 1):
			board.append(BoardSquare.new(Vector2i(line, column)))


func move_piece(piece: ChessBasePiece, to: Vector2i) -> Chessboard:
	if to == Vector2i.ZERO:
		push_error("Não há uma posição 0.")
		return self
	if piece.on_board():
		remove_piece(piece)
	var to_square: BoardSquare = get_square_by_coordinate(to)
	if to_square.has_piece():
		to_square.piece_in_square.set_coordinate(Vector2i.ZERO)
	to_square.piece_in_square = piece.set_coordinate(to)
	return self


func remove_piece(piece: ChessBasePiece) -> Chessboard:
	var square: BoardSquare = get_square_by_coordinate(piece.piece_coordinate)
	if square == null:
		push_error("Peça não encontrada na coordenada: {0}".format([piece.piece_coordinate]))
		return self
	square.piece_in_square = null
	piece.set_coordinate(Vector2i.ZERO)
	return self


func get_square_by_coordinate(coordinate: Vector2i) -> BoardSquare:
	if coordinate == Vector2i.ZERO:
		push_error("A peça não está no tabuleiro.")
		return null
	for square in board:
		if square.coordinate == coordinate:
			return square
	return null

## Para testes.
func _to_string() -> String:
	var board_str: String = ""
	for square in board:
		board_str += str(square)
		if square.coordinate.y % COLUMNS == 0:
			board_str += "\n"
	return board_str


class BoardSquare:
	var coordinate: Vector2i
	var piece_in_square: ChessBasePiece
	
	func _init(_coordinate: Vector2i) -> void:
		coordinate = _coordinate
	
	
	func has_piece() -> bool:
		return piece_in_square != null
	
	## Para testes.
	func _to_string() -> String:
		var square_str: String = "["
		if has_piece():
			square_str += str(piece_in_square)
		else:
			square_str += "  "
		square_str += "]"
		return square_str
