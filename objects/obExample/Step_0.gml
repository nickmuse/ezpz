//////////
////////// easing code!
//////////

entity_a_pos_x = ease(ez.linear, current_ease_time, start_pos_x, end_pos_x, max_ease_time)
entity_b_pos_x = ease(easing_enum_list[|selected_easing], current_ease_time, start_pos_x, end_pos_x, max_ease_time)
if current_ease_time < max_ease_time {current_ease_time++}

//////////
////////// interface code. you may ignore this.
//////////

var ctrl_change = false
// mouse control
if mouse_check_button_pressed(mb_left) {
	// all controls are at this height
	var y1 = ctrl_y - bph
	var y2 = ctrl_y + bph
	// go button pressed
	var x1 = ctrl_reset_x - bph
	var x2 = ctrl_reset_x + bph
	if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
		entity_a_pos_x = start_pos_x
		entity_b_pos_x = start_pos_x
		ctrl_change = true
	}
	// type - left button pressed
	var x1 = ctrl_type_left_x - bph
	var x2 = ctrl_type_left_x + bph
	if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
		selected_easing -= 1
		ctrl_change = true
	}
	// type - right button pressed
	var x1 = ctrl_type_right_x - bph
	var x2 = ctrl_type_right_x + bph
	if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
		selected_easing += 1
		ctrl_change = true
	}
	// time - left button pressed
	var x1 = ctrl_time_left_x - bph
	var x2 = ctrl_time_left_x + bph
	if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
		max_ease_time -= time_increment
		ctrl_change = true
	}
	// time - right button pressed
	var x1 = ctrl_time_right_x - bph
	var x2 = ctrl_time_right_x + bph
	if point_in_rectangle(mouse_x,mouse_y,x1,y1,x2,y2) {
		max_ease_time += time_increment
		ctrl_change = true
	}
}
// keyboard control
max_ease_time	+= time_increment * (keyboard_check_pressed(vk_up) - keyboard_check_pressed(vk_down))
selected_easing += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left)
// reset timer on change
if max(
	ctrl_change,
	keyboard_check_pressed(vk_enter),
	keyboard_check_pressed(vk_space),
	keyboard_check_pressed(vk_up),
	keyboard_check_pressed(vk_down),
	keyboard_check_pressed(vk_left),
	keyboard_check_pressed(vk_right)
	) {
	current_ease_time = 0
}
// limit changes to range
max_ease_time		= clamp(max_ease_time,min_ease_allowed,max_ease_allowed)
selected_easing		= clamp(selected_easing,0,ds_list_size(easing_enum_list) - 1)