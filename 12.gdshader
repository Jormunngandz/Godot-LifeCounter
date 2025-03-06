shader_type canvas_item;
render_mode unshaded;
uniform sampler2D gradient :source_color;
instance uniform float gradient_mix_amount = 1.0;
vec2 rotateUV(vec2 uv, vec2 pivot, float rotation) {

    float cosa = cos(rotation);	// Get the cos angle for the rotation
    float sina = sin(rotation);	// Get the sin angle for the rotation
	// Offset the pivot point
    uv -= pivot;
	// Calculate the rotation with basic trigonometry
	// https://education.siggraph.org/static/HyperGraph/modeling/mod_tran/2drota.htm
	// "+ pivot" restores the offset to default
    return vec2(cosa * uv.x - sina * uv.y,
				cosa * uv.y + sina * uv.x) + pivot;
}

void fragment() {
	vec2 myUv = rotateUV(UV,vec2(0.5,0.5), radians(90));
	vec3 gradientTex = texture(gradient, myUv).rgb;
	//mix(gradientTex.rgb, sampled_color, gradient_mix_amount);
	COLOR.rgb = gradientTex.rgb;
	//COLOR.rgb = mixed_color.rgb;


}