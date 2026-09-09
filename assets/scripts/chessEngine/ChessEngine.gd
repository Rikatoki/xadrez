## Composto por todos os elementos envolvendo o jogo do xadrez, esta classe é o coração do jogo.
extends Object
class_name ChessEngine

var chessboard: Chessboard = Chessboard.new()

func _init() -> void:
	pass

func _to_string() -> String:
	return str(chessboard)
