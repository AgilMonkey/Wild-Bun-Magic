class_name Spell
extends Node2D


signal spell_casted
signal spell_changed

var spell_name := "Name Please"
var description := "Desc Please"
var ammo: int = 20
var damage: int = 50
var rate_of_fire: float = 0.3
var speed: int = 700

var is_shooting: bool = false
var input_holded: bool = false


func shoot(_cur_node: Node2D):
	pass
