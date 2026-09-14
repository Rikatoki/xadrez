extends Node

var chess_engine: ChessEngine = ChessEngine.new()

var player1: ChessPlayer = ChessPlayer.new()
var player2: ChessPlayer = ChessPlayer.new()


func _ready() -> void:
	var moves: PieceMovements = PieceMovements.new(ChessEnums.ChessTeam.WHITE)
	print(chess_engine)
	chess_engine.new_game(player1, player2)
	print(chess_engine)
	print("Movimentação caso o torre estivesse de frente com os peões Brancos: ", moves.cross_move(Vector2i(3, 4)))
	print("Movimentação caso o bispo estivesse de frente com os peões brancos: ", moves.diagonal_move(Vector2i(3, 4)))
	end_test()


func end_test() -> void:
	var tree: SceneTree = get_tree()
	await tree.create_timer(0.5).timeout
	tree.quit()
