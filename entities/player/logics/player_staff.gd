extends Node2D

@export var all_spells: Array[GDScript]

var mouse_position: Vector2

@onready var cur_spell: Spell = $SpellCastPoint
@onready var staff_anim_player: AnimationPlayer = $StaffAnimationPlayer


func _ready() -> void:
	change_spell()
	#GlobalUi.cur_spell = cur_spell
	
	cur_spell.spell_casted.connect(func ():
		staff_anim_player.stop()
		staff_anim_player.play("shoot")
		)


func _process(_delta: float) -> void:
	mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	
	if Input.is_action_just_pressed("shoot"):
		if not cur_spell.is_shooting:
			staff_anim_player.play("shoot")
		cur_spell.shoot(self)
		cur_spell.input_holded = true
		
		if cur_spell.ammo <= 0:
			change_spell()
	elif Input.is_action_just_released("shoot"):
		cur_spell.input_holded = false


func change_spell():
	var all_spells_no_this = all_spells.duplicate()
	all_spells_no_this.erase($SpellCastPoint.get_script())
	var script = all_spells_no_this.pick_random()
	$SpellCastPoint.set_script(script)
	$SpellCastPoint.set_process(false)
	$SpellCastPoint.set_process(true)
	
	GlobalUi.cur_spell = cur_spell
	
	cur_spell.spell_casted.connect(func ():
		staff_anim_player.stop()
		staff_anim_player.play("shoot")
		)
