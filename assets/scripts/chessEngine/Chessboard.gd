extends Object
class_name Chessboard

var board: Dictionary[Vector2i, ChessPiece]

func _init() -> void:
	_create_board()


func _create_board() -> void:
	board = {}
	for line in range(1, ChessVariables.LINES + 1):
		for column in range(1, ChessVariables.COLUMNS + 1):
			board[Vector2i(line, column)] = null


func move_piece(piece: ChessPiece, to: Vector2i) -> Chessboard:
	if not is_valid_coordinate(to):
		return self
	if has_piece(to):
		remove_piece(to)
	board[to] = piece.set_coordinate(to)
	return self


func remove_piece(coord: Vector2i) -> Chessboard:
	if not is_valid_coordinate(coord):
		return self
	var piece: ChessPiece = get_piece_by_coordinate(coord)
	if piece == null:
		push_error("Peça não encontrada no tabuleiro: {0}".format([coord]))
		return self
	piece.set_coordinate(Vector2i.ZERO)
	board[coord] = null
	return self


func get_piece_by_coordinate(coordinate: Vector2i) -> ChessPiece:
	if not is_valid_coordinate(coordinate):
		return null
	return board.get(coordinate)


func is_valid_coordinate(coor: Vector2i) -> bool:
	var valid: bool = board.has(coor)
	if not valid:
		push_warning("Coordernadas fora do padrão: {0}".format([coor]))
	return valid


func has_piece(coordinate: Vector2i) -> bool:
	var _has_piece: bool = true if get_piece_by_coordinate(coordinate) != null else false
	return _has_piece

## Para testes.
func _to_string() -> String:
	var board_str: String = ""
	var line_str: String = ""
	for coord in board.keys():
		var piece: ChessPiece = board[coord]
		if piece == null:
			line_str += "[  ]"
		else:
			line_str += "[{0}]".format([piece])
		if coord.y % ChessVariables.COLUMNS == 0:
			board_str = line_str + "\n" + board_str
			line_str = ""
	return board_str
