draw_set_color(c_aqua)
draw_primitive_shape([x-Width, y], [x+Width, y],
 [x-Width+lengthdir_x(2000, dir), y+lengthdir_y(2000, dir)],
 [x+Width+lengthdir_x(2000, dir), y+lengthdir_y(2000, dir)])
 
draw_set_color(merge_color(c_aqua,c_black, 0.25))
var w = Width*0.75
draw_primitive_shape([x-w, y], [x+w, y],
 [x-w+lengthdir_x(2000, dir), y+lengthdir_y(2000, dir)],
 [x+w+lengthdir_x(2000, dir), y+lengthdir_y(2000, dir)])
 
draw_set_color(merge_color(c_aqua,c_black, 0.5))
var w = Width*0.5
draw_primitive_shape([x-w, y], [x+w, y],
 [x-w+lengthdir_x(2000, dir), y+lengthdir_y(2000, dir)],
 [x+w+lengthdir_x(2000, dir), y+lengthdir_y(2000, dir)])
 
draw_set_color(merge_color(c_aqua,c_black, 0.75))
var w = Width*0.25
draw_primitive_shape([x-w, y], [x+w, y],
 [x-w+lengthdir_x(2000, dir), y+lengthdir_y(2000, dir)],
 [x+w+lengthdir_x(2000, dir), y+lengthdir_y(2000, dir)])