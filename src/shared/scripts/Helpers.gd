class_name Helpers

static func sum_in_string(value: String, sum: int) -> String:
	var intCurrent = int(value)
	var newIntvalue = intCurrent+sum
	return str(newIntvalue)
