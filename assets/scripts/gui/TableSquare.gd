# Em relação à como vai ser a geração das peças.
# Para que o tamanho da peça fique correta ao tamanho do quadrado: Sprite.size(scale) = TableSquare.size * (Proporção em relação ao quadrado)
# Para que o sprite fique no meio: Sprite.position = TableSquare.size / 2
extends Node2D
class_name TableSquare

var _chess_square: ChessSquare

func set_chess_square(square: ChessSquare) -> TableSquare:
	_chess_square = square
	return self

# Coloca a piece dentro
func update_square() -> TableSquare:
	if _chess_square == null:
		push_error("Defina um _chess_square")
		return self
	_update_piece_sprite()
	return self

func _update_piece_sprite() -> TableSquare:
	var sprite: TablePiece = _get_piece_sprite()
	var square_has_piece: bool = _chess_square.has_piece()
	# Remove o sprite caso ele esteja desatualizado.
	if sprite and (not square_has_piece or (square_has_piece and _chess_square.piece != sprite.get_piece())):
		sprite.free()
		sprite = null
	if sprite == null and square_has_piece:
		var piece_sprite: TablePiece = TablePiece.new(_chess_square.piece)
		add_child(piece_sprite)
	return self

func _get_piece_sprite() -> TablePiece:
	for i in get_children():
		if i is TablePiece:
			return i
	return null
