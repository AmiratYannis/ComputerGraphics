#version 330 core

out vec4 output_color;
uniform vec4 input_color;

uniform mat4 myview_matrix;
uniform mat4 mymodel_matrix;
uniform mat3 mynormal_matrix;

in vec4 myVertex;
in vec3 myNormal;

void main (void)
{   
	vec3 camPos = vec3(0,0,0);

	vec4 fragPos = myview_matrix * mymodel_matrix  * myVertex;
	vec3 fragPosFinal = (fragPos.xyz / fragPos.w );

	vec3 normal = normalize(mynormal_matrix * myNormal);

	vec3 frag_to_cam = normalize(camPos - fragPosFinal);

	if( abs( dot(frag_to_cam,normal)) <0.2f ){
		output_color = input_color;
	}else{
		output_color = vec4(0,0,0,0);
	}

	
}