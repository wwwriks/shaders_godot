shader_type spatial;

uniform sampler2D snow_albedo;
uniform sampler2D snow_normal;
uniform sampler2D snow_roughness;
uniform sampler2D ice_albedo;
uniform sampler2D ice_normal;
uniform sampler2D ice_roughness;
uniform float uv_scale = 1.0;
uniform float snow_height = 1.0;

void fragment() {
	vec2 uv = UV * uv_scale;
	vec3 snow_a = texture(snow_albedo, UV).rgb;
	vec3 snow_n = texture(snow_normal, UV).rgb;
	float snow_r = texture(snow_roughness, UV).r;
	vec3 ice_a = texture(ice_albedo, UV).rgb;
	vec3 ice_n = texture(ice_normal, UV).rgb;
	float ice_r = texture(ice_roughness, UV).r;
	
	float snow_mask = 1.0;
	
	ALBEDO = mix(ice_a, snow_a, snow_mask);
	NORMAL_MAP = mix(ice_n, snow_n, snow_mask);
	ROUGHNESS = mix(ice_r, snow_r, snow_mask);
}

void vertex() {
	float snow_mask = 1.0;
	//VERTEX.y += snow_mask * snow_height;
}
