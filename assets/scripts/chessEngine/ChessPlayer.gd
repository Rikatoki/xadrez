extends Object
class_name ChessPlayer

var player_team: ChessEnums.ChessTeam

var player_pieces: Array[ChessPiece]


func set_player_team(team: ChessEnums.ChessTeam) -> ChessPlayer:
	player_team = team
	return self


func set_player_pieces(pieces: Array[ChessPiece]) -> ChessPlayer:
	for piece in pieces:
		_set_piece_team(piece)
	player_pieces = pieces
	return self


func append_piece(piece: ChessPiece) -> ChessPlayer:
	if player_pieces == null:
		player_pieces = []
	_set_piece_team(piece)
	player_pieces.append(piece)
	return self


func _set_piece_team(piece: ChessPiece) -> ChessPlayer:
	piece.piece_team = player_team
	return self


func remove_piece(piece: ChessPiece) -> ChessPlayer:
	if player_pieces != null:
		player_pieces.erase(piece)
	return self
