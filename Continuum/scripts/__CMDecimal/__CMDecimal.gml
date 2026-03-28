/// @ignore
function __cm_decimal(value) {
	value = clamp(value, 0, 100);
	return value / 100;
}