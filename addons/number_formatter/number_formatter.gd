# Godot Number Formatter: Number formatting library with i18n support
#
# Copyright © 2020 Hugo Locurcio and contributors - MIT License
# See `LICENSE.md` included in the source distribution for details.

extends MainLoop

# Format an integer for human-readable display, taking the current locale into account.
static func format_int(number: int) -> String:
	# Handle negative numbers by adding the "minus" sign in advance, as we discard it
	# when looping over the number.
	var formatted_number := "-" if sign(number) == -1 else ""
	var index := 0
	var number_string := str(abs(number))

	for digit in number_string:
		formatted_number += digit

		var counter := number_string.length() - index

		# Don't add a comma at the end of the number, but add a comma every 3 digits
		# (taking into account the number's length).
		if counter >= 2 and counter % 3 == 1:
			formatted_number += ","

		index += 1

	return formatted_number

# Format a floating-point number for human-readable display, taking the current locale into account.
static func format_float(number: float, precision: int = 3) -> String:
	# Handle negative numbers by adding the "minus" sign in advance, as we discard it
	# when looping over the number.
	var formatted_number := "-" if sign(number) == -1 else ""
	var index := 0
	# Take just the integer part for adding decimals.
	var integer_part := str(abs(int(number)))
	print(integer_part)

	for digit in integer_part:
		formatted_number += digit

		var counter := integer_part.length() - index

		# Don't add a comma at the end of the number, but add a comma every 3 digits
		# (taking into account the number's length).
		if counter >= 2 and counter % 3 == 1:
			formatted_number += ","

		index += 1

	# Append the fractional part to the number if there's one.
	if str(number).find(".") != -1:
		formatted_number += str(number).split(".")[1]

	return formatted_number
