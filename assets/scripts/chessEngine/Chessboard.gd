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


func get_square_by_coordinate(coordinate: Vector2i) -> BoardSquare:
	for square in board:
		if square.coordinate == coordinate:
			return square
	return null

## Para testes
func _to_string() -> String:
	var board_str: String = ""
	for square in board:
		board_str += str(square)
		if square.coordinate.y % COLUMNS == 0:
			board_str += "\n"
	return board_str


class BoardSquare:
	var coordinate: Vector2i
	func _init(_coordinate: Vector2i) -> void:
		coordinate = _coordinate
	
	
	func _to_string() -> String:
		var square_str: String = "[ ]"
		return square_str
