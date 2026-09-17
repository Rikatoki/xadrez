extends ChessPlayer
class_name ChessHumanPlayer


## Chama a interface para fazer a jogada.
func play_turn(_engine: ChessEngine) -> void:
	var gui: GUIChessboard = GUIChessboard.instance
	if not gui.selected_move.is_connected(do_move):
		gui.selected_move.connect(do_move.bind(_engine))
	await gui.selected_move
	gui.instance.update()

func do_move(piece: ChessPiece, coord: Vector2i, engine: ChessEngine) -> void:
	engine.chessboard.move_piece(piece, coord)
