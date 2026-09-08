# Talvez seja melhor usar um Node2D, afinal, as imgens que serão usadas para representar cada um, será um sprite2D.
# Isso vai mudar muito a forma que eu tenho que pensar.
# Por exemplo: Qual será o papel do ChessTable? | Como será representado cada Square?
# Ideias: 
#	Pode ter a função de controlador: Servir de Input do jogador para o sistema. Selecionamento da peça desejada e a manipulação visual dessa peça.
#	Abstração máxima: 
#		ChessTable (Controlador. Resolve inputs.)
#		TableSquare (Reprenenta cada Square. Importância visual, pode criar a peça dentro dele.)
#		TablePiece (Representa cada peça. Pode determinar o sprite que será usado)
extends Node2D
class_name ChessTable

var chess_match: ChessMatch
@onready var squares: Node2D = $Squares

func set_chess_match(_match: ChessMatch) -> ChessTable:
	chess_match = _match
	return self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func setup() -> void:
	print("CHESSTABLE -- setup")
	var squares_array = squares.get_children()
	var logic_squares_array = chess_match.board.chess_squares
	for i in range(0,64):
		var square: TableSquare = squares_array[i]
		square.set_chess_square(logic_squares_array[i]).update_square()

func update() -> void:
	pass
