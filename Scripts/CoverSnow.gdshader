shader_type spatial;

uniform sampler2D albedo_tex;
uniform sampler2D roughness_tex;
uniform sampler2D normal_tex;

uniform sampler2D snow_albedo_tex;
uniform sampler2D snow_roughness_tex;
uniform sampler2D snow_normal_tex;

uniform float snow_amount = 1.0;
uniform float snow_softness = 10.0;
uniform float snow_uv_scale = 1.0;

void fragment() {
	vec3 c = texture(albedo_tex, UV).rgb;
	float r = texture(roughness_tex, UV).r;
	vec3 n = texture(normal_tex, UV).rgb;
	
	vec3 viewspace_up = mat3(VIEW_MATRIX) * vec3(0.0, 1.0, 0.0);
	float snow_mask = clamp(dot(NORMAL, viewspace_up * snow_amount), 0.0, 1.0);
	snow_mask = pow(snow_mask, snow_softness);
	
	vec3 worldspace_pos = (INV_VIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
	vec2 worldspace_uv = worldspace_pos.xz * snow_uv_scale;
	
	vec3 snow_c = texture(snow_albedo_tex, worldspace_uv).rgb;
	float snow_r = texture(snow_roughness_tex, worldspace_uv).r;
	vec3 snow_n = texture(snow_normal_tex, worldspace_uv).rgb;
	
	ALBEDO = mix(c, snow_c, snow_mask);
	ROUGHNESS = mix(r, snow_r, snow_mask);
	NORMAL_MAP = mix(n, snow_n, snow_mask);
}
