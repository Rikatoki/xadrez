extends Object
class_name ChessBasePlayer

var player_team: ChessEnums.ChessTeam

var player_pieces: Array[ChessBasePiece]

func set_player_team(team: ChessEnums.ChessTeam) -> ChessBasePlayer:
	player_team = team
	return self

func set_player_pieces(pieces: Array[ChessBasePiece]) -> ChessBasePlayer:
	for piece in pieces:
		_set_piece_team(piece)
	player_pieces = pieces
	return self

func append_piece(piece: ChessBasePiece) -> ChessBasePlayer:
	if player_pieces == null:
		player_pieces = []
	_set_piece_team(piece)
	player_pieces.append(piece)
	return self

func _set_piece_team(piece: ChessBasePiece) -> ChessBasePlayer:
	piece.piece_team = player_team
	return self

func remove_piece(piece: ChessBasePiece) -> ChessBasePlayer:
	if player_pieces != null:
		player_pieces.erase(piece)
	return self
