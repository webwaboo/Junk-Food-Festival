// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse_button() for
//mouse buttons

function __input_config_verbs()
{
    return {
        keyboard_and_mouse:
        {
            up:    input_binding_key(vk_up),
            down:  input_binding_key(vk_down),
            left:  input_binding_key(vk_left),
            right: input_binding_key(vk_right),
            
            bloc_down:  input_binding_key("S"),
            bloc_up:  input_binding_key("W"),
            bloc_send:  input_binding_key("D"),
            bloc_shift: input_binding_key("A"),
			accept: input_binding_key(vk_enter),
			back: input_binding_key(vk_escape),
            
            //No aiming verbs since we use the mouse for that (see below for aiming verb examples)
            shoot: input_binding_mouse_button(mb_left),
            
            pause: input_binding_key(vk_escape),
        },
        
        gamepad:
        {
            up:    [input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
            down:  [input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
            left:  [input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
            right: [input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
            
            bloc_down:  input_binding_gamepad_button(gp_face1),
            bloc_send:  input_binding_gamepad_button(gp_face2),
            bloc_shift:  input_binding_gamepad_button(gp_face3),
            bloc_up: input_binding_gamepad_button(gp_face4),
			accept: input_binding_gamepad_button(gp_face1),
			back: input_binding_gamepad_button(gp_face2),
            
            aim_up:    input_binding_gamepad_axis(gp_axisrv, true),
            aim_down:  input_binding_gamepad_axis(gp_axisrv, false),
            aim_left:  input_binding_gamepad_axis(gp_axisrh, true),
            aim_right: input_binding_gamepad_axis(gp_axisrh, false),
            shoot:     [input_binding_gamepad_button(gp_shoulderlb), input_binding_gamepad_button(gp_shoulderrb)],
            
            pause: input_binding_gamepad_button(gp_start),
        },
        
        touch:
        {
            up:    input_binding_virtual_button(),
            down:  input_binding_virtual_button(),
            left:  input_binding_virtual_button(),
            right: input_binding_virtual_button(),
            
            bloc_down:  input_binding_virtual_button(),
            bloc_send:  input_binding_virtual_button(),
            bloc_shift:  input_binding_virtual_button(),
            bloc_up: input_binding_virtual_button(),
            
            pause: input_binding_virtual_button(),
        }
    };
}