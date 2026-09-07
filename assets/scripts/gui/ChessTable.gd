# Talvez seja melhor usar um Node2D, afinal, as imgens que serão usadas para representar cada um, será um sprite2D.
# Isso vai mudar muito a forma que eu tenho que pensar.
# Por exemplo: Qual será o papel do ChessTable? | Como será representado cada Square?
# Ideias: 
#	Pode ter a função de controlador: Servir de Input do jogador para o sistema. Selecionamento da peça desejada e a manipulação visual dessa peça.
#	Abstração máxima: 
#		ChessTable (Controlador. Resolve inputs.)
#		TableSquare (Reprenenta cada Square. Importância visual, pode criar a peça dentro dele.)
#		TablePiece (Representa cada peça. Pode determinar o sprite que será usado)
extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
