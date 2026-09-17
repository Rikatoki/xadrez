extends Node2D
class_name GUIChessboard

signal selected_move(piece: ChessPiece, move: Vector2i)

static var instance: GUIChessboard

## Coordernada onde começa os quadrados no tabuleiro.
@export
var squares_corner: Vector2

## Proporção de cada quadrado
@export
var square_proporsion: Vector2

var _chess_engine: ChessEngine

var _selected_square: GUISquare

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	instance = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func setup(engine: ChessEngine):
	_chess_engine = engine


func update() -> void:
	# Deleta os filhos para que atualizar com novos.
	if _selected_square == null:
		for child in get_children():
			if child is GUISquare:
				remove_child(child)
	# Não deleta os filhos para que o sprite não suma.
	else:
		for child in get_children():
			if child is GUISquare:
				if child == _selected_square:
					continue
				if child.mouse_clicked.is_connected(select_square):
					child.mouse_clicked.disconnect(select_square)
	var board: Dictionary[Vector2i, ChessPiece] = _chess_engine.chessboard.board
	for square_coord in board.keys():
		# Adiciona filhos novos de acordo com suas posicições no board.
		if _selected_square == null:
			var piece: ChessPiece = board.get(square_coord)
			if piece != null:
				var square: GUISquare = preload("res://assets/scenes/square.tscn").instantiate()
				add_child(square)
				square.position = get_square(square_coord)
				square.setup(square_coord, piece)
				square.mouse_clicked.connect(select_square)
		# Adiciona as casas que podem ser interagíveis pela peça selecionada.
		else:
			if square_coord in _selected_square.piece.get_movements():
				var square: GUISquare = preload("res://assets/scenes/square.tscn").instantiate()
				add_child(square)
				square.position = get_square(square_coord)
				square.setup(square_coord, null)
				square.mouse_clicked.connect(select_square)


func select_square(square: GUISquare) -> void:
	# Adiciona como selecionada.
	if not _selected_square:
		if not square.piece.get_movements().is_empty():
			_selected_square = square
			print(_selected_square)
			update()
	# Emite o sinal indicando que a movimentação foi feita.
	else:
		var coor: Vector2i = square.coordinate
		var piece: ChessPiece = _selected_square.piece
		selected_move.emit(piece, coor)
		_selected_square = null
		print("SINAL EMITIU")
		update()


func get_square(coord: Vector2i) -> Vector2:
	var pos: Vector2i =  squares_corner + Vector2(square_proporsion.x * (coord.x - 0.5), (square_proporsion.y * (coord.y * -1)))
	print(pos, coord)
	return pos
