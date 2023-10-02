shader_type canvas_item;

void vertex(){
	VERTEX += vec2(cos(TIME * 2.0) * 50.0, sin(TIME * 2.0) * 100.0);
}

void fragment() {
	vec4 col = texture(TEXTURE, UV);
	COLOR = vec4(UV.x,UV.y,1.0,col.a);
}
