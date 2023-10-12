shader_type spatial;

void fragment() {
	ALBEDO = (INV_VIEW_MATRIX * vec4(NORMAL, 0.0)).xyz;
}
