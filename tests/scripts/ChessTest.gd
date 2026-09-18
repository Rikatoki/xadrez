extends Node

var chess_engine: ChessEngine = ChessEngine.new()

var player1: ChessPlayer = ChessHumanPlayer.new()
var player2: ChessPlayer = ChessHumanPlayer.new()
@onready var chessboard: GUIChessboard = $Chessboard
@onready var end_game_label: Label = $GUI/EndGameLabel


func _ready() -> void:
	chessboard.setup(chess_engine)
	chessboard.update()
	print(chess_engine)
	chess_engine.new_game(player1, player2)
	print(chess_engine)
	print(player1.player_pieces)
	print(player2.player_pieces)
	chessboard.update()

func _process(delta: float) -> void:
	if chess_engine.state in [chess_engine.States.VICTORY, chess_engine.States.DRAW]:
		end_game_label.visible = true
