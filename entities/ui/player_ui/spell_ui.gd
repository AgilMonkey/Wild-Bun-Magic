extends Control


const SIMPLE_SPELL = preload("res://assets/simple_spell.png")
const SHOTGUN_SPELL = preload("res://assets/shotgun_spell.png")
const MACHINE_GUN_SPELL = preload("res://assets/machine_gun_spell.png")
const LASER_SPELL = preload("res://assets/laser_spell.png")
const DUCK_SPELL = preload("res://assets/duck_spell.png")

@onready var spell_ui: TextureRect = $SpellSlot/Spell


func _ready() -> void:
	GlobalUi.spell_changed.connect(change_spell_ui)


func _process(_delta: float) -> void:
	if GlobalUi.cur_spell == null: return
	$VBoxContainer/SpellLabel.text = "Spell: " + GlobalUi.cur_spell.spell_name
	$VBoxContainer/AmmoLabel.text = "Ammo: " + str(GlobalUi.cur_spell.ammo)
	
	var can_shoot = not GlobalUi.cur_spell.is_shooting
	if can_shoot:
		$VBoxContainer/ReloadLabel.text = "Can Shoot!"
	else:
		$VBoxContainer/ReloadLabel.text = "Reloading..."


func change_spell_ui(spell_name):
	match GlobalUi.cur_spell.spell_name:
		"Simple":
			spell_ui.texture = SIMPLE_SPELL
		"Shotgun":
			spell_ui.texture = SHOTGUN_SPELL
		"Machine Gun":
			spell_ui.texture = MACHINE_GUN_SPELL
		"Laser":
			spell_ui.texture = LASER_SPELL
		"Duck":
			spell_ui.texture = DUCK_SPELL
