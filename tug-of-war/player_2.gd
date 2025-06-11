extends Node2D
signal p2_press
var game_state: bool
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio: AudioStreamPlayer2D = $"../player1/AudioStreamPlayer2D"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_state = true
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_state:
		if Input.is_action_just_pressed("p2_press"):
			p2_press.emit()
			audio.play()
			position.x-= 1
			sprite.play("pulling")
		else:
			sprite.play("idle")


func _on_rope_game_state_sig() -> void:
	game_state = false
	 # Replace with function body.
