extends Control


func _process(delta: float) -> void:
	if GlobalUi.cur_spell == null: return
	$VBoxContainer/SpellLabel.text = "Spell: " + GlobalUi.cur_spell.spell_name
	$VBoxContainer/AmmoLabel.text = "Ammo: " + str(GlobalUi.cur_spell.ammo)
