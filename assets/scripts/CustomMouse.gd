extends Sprite2D

var mouse_image: CompressedTexture2D = preload("res://assets/sprites/cursor.png")

var interactable_mode: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hframes = 3
	vframes = 1
	z_index = 5
	texture = mouse_image
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	update_frame()
	global_position = get_global_mouse_position()

func update_frame() -> void:
	frame = 0
	if interactable_mode:
		frame = 1
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		frame = 2
	interactable_mode = false
