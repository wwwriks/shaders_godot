shader_type spatial;

uniform sampler2D noise;
uniform float noise_strength = 25.0;
uniform sampler2D snow_albedo;
uniform sampler2D snow_normal;
uniform sampler2D snow_roughness;
uniform sampler2D ice_albedo;
uniform sampler2D ice_normal;
uniform sampler2D ice_roughness;
uniform sampler2D dynamic_snow_mask;
uniform float uv_scale = 1.0;
uniform float snow_height = 1.0;
uniform float offset = 0.5;

void fragment() {
	vec2 uv = UV * uv_scale;
	vec3 snow_a = texture(snow_albedo, uv).rgb;
	vec3 snow_n = texture(snow_normal, uv).rgb;
	float snow_r = texture(snow_roughness, uv).r;
	vec3 ice_a = texture(ice_albedo, uv).rgb;
	vec3 ice_n = texture(ice_normal, uv).rgb;
	float ice_r = texture(ice_roughness, uv).r;
	
	float snow_mask = texture(dynamic_snow_mask, UV).a;
	
	ALBEDO = mix(snow_a, ice_a, snow_mask);
	NORMAL_MAP = mix(snow_n, ice_n, snow_mask);
	ROUGHNESS = mix(snow_r, ice_r, snow_mask);
	
	//ALBEDO = (INV_VIEW_MATRIX * vec4(NORMAL, 0.0)).xyz;
}

void vertex() {
	float snow_mask = texture(dynamic_snow_mask, UV).a * -1.0;
	VERTEX.y = texture(noise, UV).r * noise_strength;
	VERTEX.y *= (snow_mask * snow_height) + snow_height * snow_height + offset;
}