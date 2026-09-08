extends Node

var game_match: ChessMatch = ChessMatch.new()

var player1: ChessEntity = ChessEntity.new()
var player2: ChessEntity = ChessEntity.new()

@onready var chess_table: ChessTable = $ChessTable

func _ready() -> void:
	game_match.new_game(player1, player2)
	chess_table.set_chess_match(game_match)
	chess_table.call_deferred("setup")
