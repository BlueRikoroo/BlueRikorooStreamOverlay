function re_tile(){
	
}

function get_ids_for_walls(){
	var grid = ds_grid_create(ceil(room_width), ceil(room_height))
	with(obj_block){
		ds_grid_add(grid, floor(x/32), floor(y/32), self)	
	}
	with(obj_block){
		var gridX = floor(x/32)
		var gridY = floor(y/32)
		switch(wallType){
		case "block": #region Wall 32x32
			tileData = 45
			// 0 for block, 1 for slant_br, 2 for slant_bl, 3 for slant_tr, 4 for slant_tl
			if check_multiple(ds_grid_get(grid, gridX, gridY-1).wallType, "block", "slant_br", "slant_bl"){ //Top
				tileData = 1;
				if check_multiple(ds_grid_get(grid, gridX+1, gridY).wallType,"block","slant_bl","slant_tl"){ //Right
					tileData = 5;
					if check_multiple(ds_grid_get(grid, gridX, gridY+1).wallType,"block","slant_tr","slant_tl"){ //Bottom
					    tileData = 13;
					    if check_multiple(ds_grid_get(grid, gridX-1, gridY).wallType,"block","slant_br","slant_tr"){ //Left
					        tileData = 29;
					        if check_multiple(ds_grid_get(grid, gridX+1, gridY-1).wallType,"block","slant_bl"){ //Top Right
					            tileData = 30;
					            if check_multiple(ds_grid_get(grid, gridX+1, gridY+1).wallType,"block","slant_tl"){ //Bottom Right
					                tileData = 34;
					                if check_multiple(ds_grid_get(grid, gridX-1, gridY+1).wallType,"block","slant_tr"){ //Bottom Left
					                    tileData = 40;
					                    if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br") //Top Left
					                        tileData = choose(44, 48, 49, 50, 51)
					                }else if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br") //Top Left
					                    tileData = 41;
					            }else if check_multiple(ds_grid_get(grid, gridX-1, gridY+1).wallType,"block","slant_tr"){ //Bottom Left
					                tileData = 38;
					                if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br") //Top Left
					                    tileData = 42;
					            }else if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br") //Top Left
					                tileData = 37;
					        }else if check_multiple(ds_grid_get(grid, gridX+1, gridY+1).wallType,"block","slant_tl"){ //Bottom Right
					            tileData = 31;
					            if check_multiple(ds_grid_get(grid, gridX-1, gridY+1).wallType,"block","slant_tr"){ //Bottom Left
					                tileData = 35;
					                if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br") //Top Left
					                    tileData = 43;
					            }else if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br") //Top Left
					                tileData = 39;
					        }else if check_multiple(ds_grid_get(grid, gridX-1, gridY+1).wallType,"block","slant_tr"){ //Bottom Left
					            tileData = 32;
					            if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br") //Top Left
					                tileData = 36;
					        }else if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br") //Top Left 
					            tileData = 33;
					    }else if check_multiple(ds_grid_get(grid, gridX+1, gridY-1).wallType,"block","slant_bl"){ //Top Right
					        tileData = 17;
					        if check_multiple(ds_grid_get(grid, gridX+1, gridY+1).wallType,"block","slant_tl") //Bottom Right
					            tileData = 19;
					    }else if check_multiple(ds_grid_get(grid, gridX+1, gridY+1).wallType,"block","slant_tl")  //Bottom Right
					        tileData = 18;
					}else if check_multiple(ds_grid_get(grid, gridX-1, gridY).wallType,"block","slant_br","slant_tr"){ //Left
					    tileData = 16;
					    if check_multiple(ds_grid_get(grid, gridX+1, gridY-1).wallType,"block","slant_bl"){ //Top Right
					        tileData = 26;
					        if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br") //Top Left
					            tileData = 28;
					    }else if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br") //Top Left
					        tileData = 27;
					}else if check_multiple(ds_grid_get(grid, gridX+1, gridY-1).wallType,"block","slant_bl") //Top Right
					    tileData = 9;
				}else if check_multiple(ds_grid_get(grid, gridX, gridY+1).wallType,"block","slant_tr","slant_tl"){//Bottom
					tileData = 46;
					if check_multiple(ds_grid_get(grid, gridX-1, gridY).wallType,"block","slant_br","slant_tr"){ //Left
					    tileData = 15;
					    if check_multiple(ds_grid_get(grid, gridX-1, gridY+1).wallType,"block","slant_tr"){ //Bottom Left
					        tileData = 23;
					        if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br") //Top Left
					            tileData = 25;
					    }else if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br") //Top Left
					        tileData = 24;
					}
				}else if check_multiple(ds_grid_get(grid, gridX-1, gridY).wallType,"block","slant_br","slant_tr"){ //Left
					tileData = 8;
					if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br")//Top Left
					    tileData = 12;
				}
			}else if check_multiple(ds_grid_get(grid, gridX+1, gridY).wallType,"block","slant_bl","slant_tl"){ //Right
				tileData = 2;
				if check_multiple(ds_grid_get(grid, gridX, gridY+1).wallType,"block","slant_tr","slant_tl"){//Bottom
					tileData = 6;
					if check_multiple(ds_grid_get(grid, gridX-1, gridY).wallType,"block","slant_br","slant_tr"){//Left
					    tileData = 14;
					    if check_multiple(ds_grid_get(grid, gridX+1, gridY+1).wallType,"block","slant_tl"){ //Bottom Right
					        tileData = 20;
					        if check_multiple(ds_grid_get(grid, gridX-1, gridY+1).wallType,"block","slant_tr") //Bottom Left
					            tileData = 22;
					    }else if check_multiple(ds_grid_get(grid, gridX-1, gridY+1).wallType,"block","slant_tr") //Bottom Left
					        tileData = 21;
					}else if check_multiple(ds_grid_get(grid, gridX+1, gridY+1).wallType,"block","slant_tl") //Bottom Right
					    tileData = 10;
				}else if check_multiple(ds_grid_get(grid, gridX-1, gridY).wallType,"block","slant_br","slant_tr") //Left
					tileData = 47;
			}else if check_multiple(ds_grid_get(grid, gridX, gridY+1).wallType,"block","slant_tr","slant_tl"){//Bottom
				tileData = 3;
				if check_multiple(ds_grid_get(grid, gridX-1, gridY).wallType,"block","slant_br","slant_tr"){ //Left
					tileData = 7;
					if check_multiple(ds_grid_get(grid, gridX-1, gridY+1).wallType,"block","slant_tr")  //Bottom Left
					    tileData = 11;
				}
			}else if check_multiple(ds_grid_get(grid, gridX-1, gridY).wallType,"block","slant_br","slant_tr") //Left
				tileData = 4;
			break #endregion
		case 1: #region Slant BR
			tileData = 52
			if check_multiple(ds_grid_get(grid, gridX, gridY+1).wallType,"block","slant_tr","slant_tl"){//Bottom
				tileData = 53
				if check_multiple(ds_grid_get(grid, gridX+1, gridY).wallType,"block","slant_bl","slant_tl"){ //Right
					tileData = 55
					if check_multiple(ds_grid_get(grid, gridX+1, gridY+1).wallType,"block","slant_tl") //Bottom Right
						tileData = 56
				}
			}else if check_multiple(ds_grid_get(grid, gridX+1, gridY).wallType,"block","slant_bl","slant_tl") //Right
				tileData = 54
			break #endregion
		case 2: #region Slant BL
			tileData = 57
			if check_multiple(ds_grid_get(grid, gridX, gridY+1).wallType,"block","slant_tr","slant_tl"){//Bottom
				tileData = 58
				if check_multiple(ds_grid_get(grid, gridX-1, gridY).wallType,"block","slant_br","slant_tr"){ //Left
					tileData = 60
					if check_multiple(ds_grid_get(grid, gridX-1, gridY+1).wallType,"block","slant_tr") //Bottom Left
						tileData = 61
				}
			}else if check_multiple(ds_grid_get(grid, gridX-1, gridY).wallType,"block","slant_br","slant_tr") //Left
				tileData = 59
			break #endregion
		case 3: #region Slant TR
			tileData = 62
			if check_multiple(ds_grid_get(grid, gridX, gridY-1).wallType,"block","slant_br","slant_bl"){//Top
				tileData = 63
				if check_multiple(ds_grid_get(grid, gridX+1, gridY).wallType,"block","slant_bl","slant_tl"){ //Right
					tileData = 65
					if check_multiple(ds_grid_get(grid, gridX+1, gridY-1).wallType,"block","slant_bl") //Top Right
						tileData = 66
				}
			}else if check_multiple(ds_grid_get(grid, gridX+1, gridY).wallType,"block","slant_bl","slant_tl") //Right
				tileData = 64
			break #endregion
		case 4:	#region Slant TL
			tileData = 67
			if check_multiple(ds_grid_get(grid, gridX, gridY-1).wallType,"block","slant_br","slant_bl"){//Top
				tileData = 68
				if check_multiple(ds_grid_get(grid, gridX-1, gridY).wallType,"block","slant_br","slant_tr"){ //Left
					tileData = 70
					if check_multiple(ds_grid_get(grid, gridX-1, gridY-1).wallType,"block","slant_br") //Top Left
						tileData = 71
				}
			}else if check_multiple(ds_grid_get(grid, gridX-1, gridY).wallType,"block","slant_br","slant_tr") //Left
				tileData = 69
			break #endregion
		}
		return tileData	
	}
}