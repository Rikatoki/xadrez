extends RefCounted
class_name ChessReport

enum EndTypes{
	VICTORY,
	DRAW
}
var end_type: EndTypes
var winner: ChessEntity

func _init(_end_type: EndTypes) -> void:
	end_type = _end_type
