shader_type spatial;

uniform sampler2D albedo;
uniform sampler2D roughness;
uniform sampler2D normal;

uniform sampler2D parallax;
uniform int num_layers;
uniform float depth;

void fragment() {
	vec2 base_uv = UV * 500.0;
	mat3 tangent2view = mat3(TANGENT, NORMAL, -BINORMAL);
	vec3 t_view = VIEW * tangent2view;
	vec2 move_uv = t_view.xz;
	float layers = 0.0;
	
	for(int i = 0; i < num_layers; i++)
	{
		float ratio = float(i)/float(num_layers);
		layers += texture(parallax, base_uv + move_uv * mix(0.0, depth, ratio)).r;
	}
	
	layers /= float(num_layers);
	
	ALBEDO = texture(albedo, base_uv).rgb + vec3(layers);
	NORMAL_MAP = texture(normal, base_uv).rgb;
	ROUGHNESS = texture(roughness, base_uv).r * 2.0;
}
