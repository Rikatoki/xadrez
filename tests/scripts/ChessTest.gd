extends Node

var chess_engine: ChessEngine = ChessEngine.new()

var player1: ChessBasePlayer = ChessBasePlayer.new()
var player2: ChessBasePlayer = ChessBasePlayer.new()

func _ready() -> void:
	print(chess_engine)
	chess_engine.new_game(player1, player2)
	print(chess_engine)
	end_test()

func end_test() -> void:
	var tree: SceneTree = get_tree()
	await tree.create_timer(0.5).timeout
	tree.quit()
