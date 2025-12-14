extends ColorRect

func set_Protanopie() -> void:
	var mat := material as ShaderMaterial
	mat.set_shader_parameter("mode", 1)

func set_Deutéranopie() -> void:
	var mat := material as ShaderMaterial
	mat.set_shader_parameter("mode", 2)

func set_Tritanopie() -> void:
	var mat := material as ShaderMaterial
	mat.set_shader_parameter("mode", 3)
	
func set_None() -> void:
	var mat := material as ShaderMaterial
	mat.set_shader_parameter("mode", 0)
