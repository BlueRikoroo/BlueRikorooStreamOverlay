#region Draw Mouse

var X = snap(mouse_x-16, 32)
var Y = snap(mouse_y-16, 32)
var spr = spr_col_square_32x32
switch(blockShape){
case BlockShape.slant_bl: spr = spr_col_slant_bl break
case BlockShape.slant_br: spr = spr_col_slant_br break
case BlockShape.slant_tl: spr = spr_col_slant_tl break
case BlockShape.slant_tr: spr = spr_col_slant_tr break
}
draw_sprite(spr, 0, X, Y)
#endregion