extends Object
class_name Chessboard

var chess_squares: Array[ChessSquare]

func _init() -> void:
	_create_matriz()

func _create_matriz() -> void:
	var matriz: Array[ChessSquare] = []
	for column in range(1,9):
		for line in range(1,9):
			matriz.append(ChessSquare.new(self, Vector2i(line,column)))

func get_square_by_coordinate(coordinate: Vector2i) -> ChessSquare:
	for i in chess_squares:
		if i.coordinate == coordinate:
			return i
	return null

static func move_piece(piece: ChessPiece, square: ChessSquare) -> void:
	piece.square = square
	square.piece = piece

static func remove_piece(piece: ChessPiece = null, square: ChessSquare =  null) -> void:
	if piece:
		piece.square.piece = null
		piece.square = null
	elif square:
		square.piece.square = null
		square.piece = null
	else:
		push_warning("Adicione um dos argumentos para remover a peça.")
