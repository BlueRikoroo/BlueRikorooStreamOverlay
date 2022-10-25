draw_set_color(c_grey)
draw_rectangle(50, 10, 1870, 50, false)
draw_set_color(c_red)
var hppos = 910-910*HP/HP_max
draw_rectangle(50+hppos, 10, 1870-hppos, 50, false)

draw_text_setup(fnt_subStatueUsername_tier3, fa_center, fa_middle)
draw_text_outline(960, 34, "BOSS  "+string(HP) + " HP", 2, c_red, c_black)
