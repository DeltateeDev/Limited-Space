shader_type canvas_item;

uniform sampler2D mask;
uniform float scale : hint_range(0.0, 1.0, 0.1);

void fragment() {
	float new_scale = scale == 0.0 ? 0.0 : pow(2.0, 10.0 * scale - 10.0);
	new_scale *= 75.0f;
	int cutoff = int(new_scale / 75.0f);
	vec2 offset = vec2(0.5, 0.5) * (1.0 - new_scale);
	vec4 mask_color = texture(mask, UV * new_scale + offset);
	COLOR.a = 1.0 - mask_color.a + float(cutoff);
}
