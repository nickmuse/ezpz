// text properties
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(foExamples)
draw_set_color(p_white)
// squares
draw_text(ease_text_a_x,entity_a_pos_y,"linear")
draw_sprite(spBox,0,entity_a_pos_x,entity_a_pos_y)
draw_text(ease_text_b_x,entity_b_pos_y,easing_name_list[|selected_easing])
draw_sprite(spBox,0,entity_b_pos_x,entity_b_pos_y)
// time control
draw_sprite_ext(spArrow,0,ctrl_time_left_x,ctrl_y,1,1,0,c_white,1)
draw_text(ctrl_time_text_x,ctrl_y,string(current_ease_time)+"/"+string(max_ease_time))
draw_sprite_ext(spArrow,0,ctrl_time_right_x,ctrl_y,1,1,180,c_white,1)
// type control
draw_sprite_ext(spArrow,0,ctrl_type_left_x,ctrl_y,1,1,0,c_white,1)
draw_text(ctrl_type_text_x,ctrl_y,easing_name_list[|selected_easing])
draw_sprite_ext(spArrow,0,ctrl_type_right_x,ctrl_y,1,1,180,c_white,1)
// reset control
draw_sprite(spReset,0,ctrl_reset_x,ctrl_y)
// branding
draw_set_color(p_gray)
draw_text(branding_x,branding_y,"ezpz by Nick Muse")