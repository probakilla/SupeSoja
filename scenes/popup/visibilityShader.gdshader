shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform int mode = 0;
/*
0 = Aucun
1 = Protanopie
2 = Deutéranopie
3 = Tritanopie
*/

void fragment() {
    vec4 col = texture(SCREEN_TEXTURE, SCREEN_UV);

    mat3 m = mat3(
        vec3(1.0, 0.0, 0.0),
        vec3(0.0, 1.0, 0.0),
        vec3(0.0, 0.0, 1.0)
    );

    if (mode == 1) { 
        // Protanopie
        m = mat3(
            vec3(0.56667, 0.55833, 0.0),
            vec3(0.43333, 0.44167, 0.24167),
            vec3(0.0,     0.0,     0.75833)
        );
    } else if (mode == 2) {
        // Deutéranopie
        m = mat3(
            vec3(0.625, 0.70,  0.0),
            vec3(0.375, 0.30,  0.30),
            vec3(0.0,   0.0,   0.70)
        );
    } else if (mode == 3) {
        // Tritanopie
        m = mat3(
            vec3(0.95,  0.0,   0.0),
            vec3(0.05,  0.433, 0.475),
            vec3(0.0,   0.567, 0.525)
        );
    } else {
        COLOR = col;
    }

    vec3 result = m * col.rgb;
    COLOR = vec4(result, col.a);
}
