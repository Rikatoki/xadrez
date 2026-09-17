extends Node

var chess_engine: ChessEngine = ChessEngine.new()

var player1: ChessPlayer = ChessHumanPlayer.new()
var player2: ChessPlayer = ChessHumanPlayer.new()
@onready var chessboard: GUIChessboard = $Chessboard


func _ready() -> void:
	chessboard.setup(chess_engine)
	chessboard.update()
	print(chess_engine)
	chess_engine.new_game(player1, player2)
	print(chess_engine)
	print(player1.player_pieces)
	print(player2.player_pieces)
	chessboard.update()


func end_test() -> void:
	get_tree().quit()
