//////////
////////// easing code!
//////////

current_ease_time	= 0
max_ease_time		= 60

//////////
////////// interface code. you may ignore this.
//////////

#macro p_white		15790834
#macro p_gray		7296087
selected_easing		= 0
time_increment		= 5
min_ease_allowed	= 5
max_ease_allowed	= 100
bph					= sprite_get_width(spReset)
var cols			= 8
var rows			= 5
start_pos_x			= 2 * room_width  / cols
end_pos_x			= 7 * room_width  / cols
ease_text_a_x		= 1 * room_width  / cols
entity_a_pos_x		= start_pos_x
entity_a_pos_y		= 2 * room_height / rows
ease_text_b_x		= 1 * room_width  / cols
entity_b_pos_x		= start_pos_x
entity_b_pos_y		= 3 * room_height / rows
ctrl_y				= 4 * room_height / rows
ctrl_reset_x		= 7 * room_width  / cols
ctrl_time_left_x	= 1 * room_width  / cols
ctrl_time_text_x	= 2 * room_width  / cols
ctrl_time_right_x	= 3 * room_width  / cols
ctrl_type_left_x	= 4 * room_width  / cols
ctrl_type_text_x	= 5 * room_width  / cols
ctrl_type_right_x	= 6 * room_width  / cols
branding_x			= room_width / 2
branding_y			= 1 * room_height / rows
easing_enum_list	= ds_list_create()
easing_name_list	= ds_list_create()
ds_list_add(easing_enum_list,ez.linear)
ds_list_add(easing_enum_list,ez.in_quad)
ds_list_add(easing_enum_list,ez.out_quad)
ds_list_add(easing_enum_list,ez.in_out_quad)
ds_list_add(easing_enum_list,ez.in_cubic)
ds_list_add(easing_enum_list,ez.out_cubic)
ds_list_add(easing_enum_list,ez.in_out_cubic)
ds_list_add(easing_enum_list,ez.in_quart)
ds_list_add(easing_enum_list,ez.out_quart)
ds_list_add(easing_enum_list,ez.in_out_quart)
ds_list_add(easing_enum_list,ez.in_quint)
ds_list_add(easing_enum_list,ez.out_quint)
ds_list_add(easing_enum_list,ez.in_out_quint)
ds_list_add(easing_enum_list,ez.in_sine)
ds_list_add(easing_enum_list,ez.in_out_sine)
ds_list_add(easing_enum_list,ez.in_circ)
ds_list_add(easing_enum_list,ez.out_circ)
ds_list_add(easing_enum_list,ez.in_out_circ)
ds_list_add(easing_enum_list,ez.in_expo)
ds_list_add(easing_enum_list,ez.out_expo)
ds_list_add(easing_enum_list,ez.in_out_expo)
ds_list_add(easing_enum_list,ez.in_elastic)
ds_list_add(easing_enum_list,ez.out_elastic)
ds_list_add(easing_enum_list,ez.in_out_elastic)
ds_list_add(easing_enum_list,ez.in_back)
ds_list_add(easing_enum_list,ez.out_back)
ds_list_add(easing_enum_list,ez.in_out_back)
ds_list_add(easing_enum_list,ez.in_bounce)
ds_list_add(easing_enum_list,ez.out_bounce)
ds_list_add(easing_enum_list,ez.in_out_bounce)
ds_list_add(easing_name_list,"linear")
ds_list_add(easing_name_list,"in_quad")
ds_list_add(easing_name_list,"out_quad")
ds_list_add(easing_name_list,"in_out_quad")
ds_list_add(easing_name_list,"in_cubic")
ds_list_add(easing_name_list,"out_cubic")
ds_list_add(easing_name_list,"in_out_cubic")
ds_list_add(easing_name_list,"in_quart")
ds_list_add(easing_name_list,"out_quart")
ds_list_add(easing_name_list,"in_out_quart")
ds_list_add(easing_name_list,"in_quint")
ds_list_add(easing_name_list,"out_quint")
ds_list_add(easing_name_list,"in_out_quint")
ds_list_add(easing_name_list,"in_sine")
ds_list_add(easing_name_list,"in_out_sine")
ds_list_add(easing_name_list,"in_circ")
ds_list_add(easing_name_list,"out_circ")
ds_list_add(easing_name_list,"in_out_circ")
ds_list_add(easing_name_list,"in_expo")
ds_list_add(easing_name_list,"out_expo")
ds_list_add(easing_name_list,"in_out_expo")
ds_list_add(easing_name_list,"in_elastic")
ds_list_add(easing_name_list,"out_elastic")
ds_list_add(easing_name_list,"in_out_elastic")
ds_list_add(easing_name_list,"in_back")
ds_list_add(easing_name_list,"out_back")
ds_list_add(easing_name_list,"in_out_back")
ds_list_add(easing_name_list,"in_bounce")
ds_list_add(easing_name_list,"out_bounce")
ds_list_add(easing_name_list,"in_out_bounce")