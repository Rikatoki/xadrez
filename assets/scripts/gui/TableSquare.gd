# Em relação à como vai ser a geração das peças.
# Para que o tamanho da peça fique correta ao tamanho do quadrado: Sprite.size(scale) = TableSquare.size * (Proporção em relação ao quadrado)
# Para que o sprite fique no meio: Sprite.position = TableSquare.size / 2
extends Panel
class_name TableSquare

var _chess_square: ChessSquare

func _init() -> void:
	set_anchors_preset(Control.PRESET_FULL_RECT)

func set_chess_square(square: ChessSquare) -> TableSquare:
	_chess_square = square
	return self
