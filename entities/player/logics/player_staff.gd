extends Node2D

@export var all_spells: Array[GDScript]

var mouse_position: Vector2

@onready var cur_spell: Spell = $SpellCastPoint
@onready var staff_anim_player: AnimationPlayer = $StaffAnimationPlayer


func _ready() -> void:
	GlobalUi.cur_spell = cur_spell


func _process(_delta: float) -> void:
	mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	
	if Input.is_action_just_pressed("shoot"):
		if not cur_spell.is_shooting:
			staff_anim_player.play("shoot")
		cur_spell.shoot(self)
		
		if cur_spell.ammo <= 0:
			change_spell()


func change_spell():
	var all_spells_no_this = all_spells.duplicate()
	all_spells_no_this.erase($SpellCastPoint.get_script())
	var script = all_spells_no_this.pick_random()
	$SpellCastPoint.set_script(script)
	
	GlobalUi.cur_spell = cur_spell
