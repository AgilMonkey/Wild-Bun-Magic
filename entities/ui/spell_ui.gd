extends Control


func _process(_delta: float) -> void:
	if GlobalUi.cur_spell == null: return
	$VBoxContainer/SpellLabel.text = "Spell: " + GlobalUi.cur_spell.spell_name
	$VBoxContainer/AmmoLabel.text = "Ammo: " + str(GlobalUi.cur_spell.ammo)
	
	var can_shoot = not GlobalUi.cur_spell.is_shooting
	if can_shoot:
		$VBoxContainer/ReloadLabel.text = "Can Shoot!"
	else:
		$VBoxContainer/ReloadLabel.text = "Reloading..."
