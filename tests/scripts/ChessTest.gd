extends Node

var chess_engine: ChessEngine = ChessEngine.new()

var player1: ChessPlayer = ChessPlayer.new()
var player2: ChessPlayer = ChessPlayer.new()


func _ready() -> void:
	print(chess_engine)
	chess_engine.new_game(player1, player2)
	print(player1.player_pieces)
	print(player2.player_pieces)


func end_test() -> void:
	var tree: SceneTree = get_tree()
	await tree.create_timer(0.5).timeout
	tree.quit()
