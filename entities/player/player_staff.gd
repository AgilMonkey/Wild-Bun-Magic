extends Node2D

@export var all_spells: Array[GDScript]

var mouse_position: Vector2

@onready var cur_spell: Spell = $SpellCastPoint


func _process(_delta: float) -> void:
	mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	
	if Input.is_action_just_pressed("shoot"):
		if cur_spell.ammo <=0:
			change_spell()
		else:
			cur_spell.shoot(self)


func change_spell():
	var all_spells_no_this = all_spells.duplicate()
	all_spells_no_this.erase($SpellCastPoint.get_script())
	var script = all_spells_no_this.pick_random()
	$SpellCastPoint.set_script(script)
