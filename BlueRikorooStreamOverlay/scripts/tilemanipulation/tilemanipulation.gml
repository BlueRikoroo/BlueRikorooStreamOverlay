function re_tile(){
	ds_map_clear(global.tileMap)
	var grid = ds_grid_create(ceil(room_width/32), ceil(room_height/32))
	with(obj_block){
		ds_grid_set(grid, floor(x/32), floor(y/32), id)
		lastBlock = !collision_line(x+16,y+16,x+16,room_height,obj_block,false,true)
		if is_undefined(global.tileMap[? tile]){
			global.tileMap[? tile] = layer_tilemap_create(getLayer(Layer.blocks), 0, 0, tile, ceil(room_width/32), ceil(room_height/32))
			// show_debug_message("Creating Tilemap " + string(global.tileMap[? tile]))
		}
	}
	var lastGridY = snap(room_height+16,32)
	with(obj_block){
		var gridX = floor(x/32)
		var gridY = floor(y/32)
		switch(blockShape){
		case 0: #region Wall 32x32
			tileData = 45
			// 0 for block, 1 for slant_br, 2 for slant_bl, 3 for slant_tr, 4 for slant_tl
			if check_multiple(getBlockshape(grid, gridX, gridY-1), 0, 1, 2){ //Top
				tileData = 1;
				if check_multiple(getBlockshape(grid, gridX+1, gridY),0,2,4){ //Right
					tileData = 5;
					if check_multiple(getBlockshape(grid, gridX, gridY+1),0,3,4) or lastBlock{ //Bottom
					    tileData = 13;
					    if check_multiple(getBlockshape(grid, gridX-1, gridY),0,1,3){ //Left
					        tileData = 29;
					        if check_multiple(getBlockshape(grid, gridX+1, gridY-1),0,2){ //Top Right
					            tileData = 30;
					            if check_multiple(getBlockshape(grid, gridX+1, gridY+1),0,4) or lastBlock{ //Bottom Right
					                tileData = 34;
					                if check_multiple(getBlockshape(grid, gridX-1, gridY+1),0,3) or lastBlock{ //Bottom Left
					                    tileData = 40;
					                    if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1) //Top Left
					                        tileData = choose(44, 48, 49, 50, 51)
					                }else if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1) //Top Left
					                    tileData = 41;
					            }else if check_multiple(getBlockshape(grid, gridX-1, gridY+1),0,3) or lastBlock{ //Bottom Left
					                tileData = 38;
					                if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1) //Top Left
					                    tileData = 42;
					            }else if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1) //Top Left
					                tileData = 37;
					        }else if check_multiple(getBlockshape(grid, gridX+1, gridY+1),0,4) or lastBlock{ //Bottom Right
					            tileData = 31;
					            if check_multiple(getBlockshape(grid, gridX-1, gridY+1),0,3) or lastBlock{ //Bottom Left
					                tileData = 35;
					                if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1) //Top Left
					                    tileData = 43;
					            }else if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1) //Top Left
					                tileData = 39;
					        }else if check_multiple(getBlockshape(grid, gridX-1, gridY+1),0,3) or lastBlock{ //Bottom Left
					            tileData = 32;
					            if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1) //Top Left
					                tileData = 36;
					        }else if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1) //Top Left 
					            tileData = 33;
					    }else if check_multiple(getBlockshape(grid, gridX+1, gridY-1),0,2){ //Top Right
					        tileData = 17;
					        if check_multiple(getBlockshape(grid, gridX+1, gridY+1),0,4) or lastBlock //Bottom Right
					            tileData = 19;
					    }else if check_multiple(getBlockshape(grid, gridX+1, gridY+1),0,4) or lastBlock  //Bottom Right
					        tileData = 18;
					}else if check_multiple(getBlockshape(grid, gridX-1, gridY),0,1,3){ //Left
					    tileData = 16;
					    if check_multiple(getBlockshape(grid, gridX+1, gridY-1),0,2){ //Top Right
					        tileData = 26;
					        if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1) //Top Left
					            tileData = 28;
					    }else if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1) //Top Left
					        tileData = 27;
					}else if check_multiple(getBlockshape(grid, gridX+1, gridY-1),0,2) //Top Right
					    tileData = 9;
				}else if check_multiple(getBlockshape(grid, gridX, gridY+1),0,3,4) or lastBlock{//Bottom
					tileData = 46;
					if check_multiple(getBlockshape(grid, gridX-1, gridY),0,1,3){ //Left
					    tileData = 15;
					    if check_multiple(getBlockshape(grid, gridX-1, gridY+1),0,3) or lastBlock{ //Bottom Left
					        tileData = 23;
					        if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1) //Top Left
					            tileData = 25;
					    }else if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1) //Top Left
					        tileData = 24;
					}
				}else if check_multiple(getBlockshape(grid, gridX-1, gridY),0,1,3){ //Left
					tileData = 8;
					if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1)//Top Left
					    tileData = 12;
				}
			}else if check_multiple(getBlockshape(grid, gridX+1, gridY),0,2,4){ //Right
				tileData = 2;
				if check_multiple(getBlockshape(grid, gridX, gridY+1),0,3,4) or lastBlock{//Bottom
					tileData = 6;
					if check_multiple(getBlockshape(grid, gridX-1, gridY),0,1,3){//Left
					    tileData = 14;
					    if check_multiple(getBlockshape(grid, gridX+1, gridY+1),0,4) or lastBlock{ //Bottom Right
					        tileData = 20;
					        if check_multiple(getBlockshape(grid, gridX-1, gridY+1),0,3) or lastBlock //Bottom Left
					            tileData = 22;
					    }else if check_multiple(getBlockshape(grid, gridX-1, gridY+1),0,3) or lastBlock //Bottom Left
					        tileData = 21;
					}else if check_multiple(getBlockshape(grid, gridX+1, gridY+1),0,4) or lastBlock //Bottom Right
					    tileData = 10;
				}else if check_multiple(getBlockshape(grid, gridX-1, gridY),0,1,3) //Left
					tileData = 47;
			}else if check_multiple(getBlockshape(grid, gridX, gridY+1),0,3,4) or lastBlock{//Bottom
				tileData = 3;
				if check_multiple(getBlockshape(grid, gridX-1, gridY),0,1,3){ //Left
					tileData = 7;
					if check_multiple(getBlockshape(grid, gridX-1, gridY+1),0,3) or lastBlock  //Bottom Left
					    tileData = 11;
				}
			}else if check_multiple(getBlockshape(grid, gridX-1, gridY),0,1,3) //Left
				tileData = 4;
			break #endregion
		case 1: #region Slant BR
			mask_index = spr_col_slant_br
			tileData = 52
			if check_multiple(getBlockshape(grid, gridX, gridY+1),0,3,4) or lastBlock{//Bottom
				tileData = 53
				if check_multiple(getBlockshape(grid, gridX+1, gridY),0,2,4){ //Right
					tileData = 55
					if check_multiple(getBlockshape(grid, gridX+1, gridY+1),0,4) or lastBlock //Bottom Right
						tileData = 56
				}
			}else if check_multiple(getBlockshape(grid, gridX+1, gridY),0,2,4) //Right
				tileData = 54
			break #endregion
		case 2: #region Slant BL
			mask_index = spr_col_slant_bl
			tileData = 57
			if check_multiple(getBlockshape(grid, gridX, gridY+1),0,3,4) or lastBlock{//Bottom
				tileData = 58
				if check_multiple(getBlockshape(grid, gridX-1, gridY),0,1,3){ //Left
					tileData = 60
					if check_multiple(getBlockshape(grid, gridX-1, gridY+1),0,3) or lastBlock //Bottom Left
						tileData = 61
				}
			}else if check_multiple(getBlockshape(grid, gridX-1, gridY),0,1,3) //Left
				tileData = 59
			break #endregion
		case 3: #region Slant TR
			mask_index = spr_col_slant_tr
			tileData = 62
			if check_multiple(getBlockshape(grid, gridX, gridY-1),0,1,2){//Top
				tileData = 63
				if check_multiple(getBlockshape(grid, gridX+1, gridY),0,2,4){ //Right
					tileData = 65
					if check_multiple(getBlockshape(grid, gridX+1, gridY-1),0,2) //Top Right
						tileData = 66
				}
			}else if check_multiple(getBlockshape(grid, gridX+1, gridY),0,2,4) //Right
				tileData = 64
			break #endregion
		case 4:	#region Slant TL
			mask_index = spr_col_slant_tl
			tileData = 67
			if check_multiple(getBlockshape(grid, gridX, gridY-1),0,1,2){//Top
				tileData = 68
				if check_multiple(getBlockshape(grid, gridX-1, gridY),0,1,3){ //Left
					tileData = 70
					if check_multiple(getBlockshape(grid, gridX-1, gridY-1),0,1) //Top Left
						tileData = 71
				}
			}else if check_multiple(getBlockshape(grid, gridX-1, gridY),0,1,3) //Left
				tileData = 69
			break #endregion
		}
		
		tilemap_set(global.tileMap[? tile], tileData, gridX, gridY)
		if lastBlock{
			for(var Y = gridY+1; Y < lastGridY; Y++){
				tilemap_set(global.tileMap[? tile], choose(44, 48, 49, 50, 51), gridX, Y)
			}
		}
	}
	
}