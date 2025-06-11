extends Node2D
var rope_pos
var game_state: bool
signal game_state_sig
@export var win_cond = 10
@onready var nose2: Area2D = $"../player2/Area2D"
@onready var nose1: Area2D = $"../player1/Area2D"
@onready var kiss: AudioStreamPlayer = $KissSoundEffect
@onready var wow_sound_effect: AudioStreamPlayer = $WowSoundEffect
@onready var love: AnimatedSprite2D = $"../player1/love"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rope_pos = 0
	love.visible = false
	game_state = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_state:
		position.x = rope_pos
		print(rope_pos)
		if rope_pos == win_cond:
			game_state = false
			game_state_sig.emit()
			print("player2 wins")
		elif rope_pos == -win_cond:
			game_state_sig.emit()
			game_state = false
			print("player1 wins")
		
		if nose1.overlaps_area(nose2):
			game_state_sig.emit()
			game_state = false
			kiss.play()
			await get_tree().create_timer(0.75).timeout
			love.visible = true
			wow_sound_effect.play()
			print("THEY KISSED!!!")
		


func _on_player_1_p_1_press() -> void:
	if game_state:
		rope_pos+=1 # Replace with function body.


func _on_player_2_p_2_press() -> void:
	if game_state:
		rope_pos-=1 # Replace with function body.
