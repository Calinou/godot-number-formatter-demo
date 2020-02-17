# Godot Number Formatter: Demonstration project
#
# Copyright © 2020 Hugo Locurcio and contributors - MIT License
# See `LICENSE.md` included in the source distribution for details.

extends Control

const NumberFormatter = preload("res://addons/number_formatter/number_formatter.gd")

const INTEGERS = [
	123,
	12345,
	123456789,
	1234567890123456789,
	-1,
	-4000,
	0,
	1e10,
]

const FLOATS = [
	1.23,
	12.345,
	123.456789,
	123456.789,
	-1,
	-40.00,
	0,
	1e10,
]

onready var container: VBoxContainer = $VBoxContainer

func add_label(text: String) -> void:
	var label := Label.new()
	label.align = Label.ALIGN_CENTER
	label.text = text
	container.add_child(label)

func _ready():
	add_label("=== Integers ===")

	for integer in INTEGERS:
		add_label(NumberFormatter.format_int(integer))

	add_label("=== Floats ===")

	for float_number in FLOATS:
		add_label(NumberFormatter.format_float(float_number))
