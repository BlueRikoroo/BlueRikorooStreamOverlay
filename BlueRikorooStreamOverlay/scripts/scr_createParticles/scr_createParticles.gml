function scr_createParticles(){
	global.particle_system = part_system_create()
	#region Raid Bullet Particle

	particle_portalRocket = part_type_create()
	var p = particle_portalRocket
	part_type_shape(p,10)
	part_type_scale(p,0.5,0.5)
	part_type_size(p,0.5,2,0,0.90)
	part_type_life(p,60,60)
	part_type_direction(p,0,360,0,0)
	part_type_speed(p, 0, 2, 0, 0)
	part_type_color2(p,10224966,134674)
	part_type_alpha2(p,1,0)
	particle_raidPortal = part_type_create()
	var p = particle_raidPortal
	part_type_shape(p,10)
	part_type_scale(p,0.5,0.5)
	part_type_size(p,0.5,2,0,0.90)
	part_type_life(p,60,60)
	part_type_direction(p,0,360,0,0)
	part_type_speed(p, 0, 2, 0, 0)
	part_type_color2(p,10224966,134674)
	part_type_alpha2(p,1,0)

	#endregion
	#region Sub Click Particle

	particle_subClick = part_type_create()
	p = particle_subClick
	part_type_shape(p, pt_shape_ring)
	part_type_size(p, 0, 0, 0.03, 0)
	part_type_life(p, 45, 45)

	#endregion
	#region Neutral Bullet Trail
	
	particle_neutralBullet = part_type_create();
	p = particle_neutralBullet
	part_type_sprite(p,spr_effect_slime,0,0,0);
	part_type_size(p,0.2,1,-0.02,0.10);
	part_type_scale(p,1,1);
	part_type_alpha1(p,1);
	part_type_speed(p,0.10,0.20,0,0);
	part_type_direction(p,0,359,0,0);
	part_type_orientation(p,0,0,0,0,0);
	part_type_blend(p,0);
	part_type_life(p,10,30);
	part_type_gravity(p,0.02,180+90);
	
	#endregion
	#region Fire Bullet
	
	particle_fireBullet = part_type_create();
	p = particle_fireBullet
	part_type_sprite(p,spr_effect_meteor,0,0,0);
	part_type_size(p,.5,.5,-0.05,0);
	part_type_scale(p,1,0.50);
	part_type_color3(p,8454143,14847,255);
	part_type_alpha3(p,1,1,1);
	part_type_speed(p,.5,2,0,0);
	part_type_orientation(p,0,0,0,0,1);
	part_type_life(p,10,30);
	part_type_blend(p,0)	
	part_type_direction(p,120+90,240+90,0.30,0);
	part_type_gravity(p,.7,180+90);
	
	#endregion
	#region Earth Bullet
	
	particle_earthBullet = part_type_create();
	p = particle_earthBullet
	part_type_shape(p,pt_shape_explosion);
	part_type_size(p,0.10,0.50,0.01,0);
	part_type_color2(p,8421504,15737);
	part_type_alpha3(p,1,0.25,0);
	part_type_speed(p,0.10,0.10,0,0);
	part_type_direction(p,0,359,0,0);
	part_type_orientation(p,0,359,0.10,0,0);
	part_type_life(p,30,30);
	
	#endregion
	#region Metal Bullet
	
	particle_metalBullet = part_type_create();
	p = particle_metalBullet
	part_type_shape(p,pt_shape_line);
	part_type_size(p,0.50,0.50,0,0);
	part_type_color3(p,c_gray,c_ltgray,c_white);
	part_type_alpha3(p,0.5,0.4,0);
	part_type_speed(p,0.10,0.10,0,0);
	part_type_direction(p,265,275,0,0);
	part_type_orientation(p,90,90,0,0,0);
	part_type_life(p,20,20);
	
	#endregion
	#region Storm Bullet
	
	particle_stormBullet = part_type_create();
	p = particle_stormBullet
	part_type_shape(p,pt_shape_line);
	part_type_size(p,0.50,0.50,0,0);
	part_type_color2(p,c_yellow,c_white);
	part_type_alpha3(p,0.5,0.4,0);
	part_type_speed(p,0.10,0.10,0,0);
	part_type_direction(p,265,275,0,0);
	part_type_orientation(p,90,90,0,0,0);
	part_type_life(p,20,20);
	
	#endregion
	#region Nature Bullet
	
	particle_natureBullet = part_type_create();
	p = particle_natureBullet
	part_type_shape(p,pt_shape_line);
	part_type_size(p,0.50,0.50,0,0);
	part_type_color2(p,c_green,c_lime);
	part_type_alpha3(p,0.5,0.4,0);
	part_type_speed(p,0.10,0.10,0,0);
	part_type_direction(p,265,275,0,0);
	part_type_orientation(p,90,90,0,0,0);
	part_type_life(p,20,20);
	
	#endregion
	#region Water Bullet
	
	particle_waterBullet = part_type_create();
	p = particle_waterBullet
	part_type_shape(p,pt_shape_disk);
	part_type_size(p,0.05,0.10,0,0.01);
	part_type_scale(p,1,1);
	part_type_color2(p,16751462,16769968);
	part_type_alpha2(p,1,1);
	part_type_speed(p,1,1,0,0);
	part_type_direction(p,0,359,0,0);
	part_type_gravity(p,0.10,270);
	part_type_orientation(p,0,0,0,0,1);
	part_type_blend(p,0);
	part_type_life(p,30,45);
	
	#endregion
	#region Ice Bullet
		
	particle_iceBullet = part_type_create();
	p = particle_iceBullet
	part_type_shape(p,pt_shape_explosion);
	part_type_size(p,0.20,0.50,0.01,0);
	part_type_scale(p,1,1);
	part_type_color1(p,16777145);
	part_type_alpha2(p,0.20,0);
	part_type_speed(p,0.20,0.30,0,0);
	part_type_direction(p,200,340,0,0);
	part_type_gravity(p,0,270);
	part_type_orientation(p,0,359,0,0,0);
	part_type_blend(p,1);
	part_type_life(p,60,80);
	
	#endregion
	#region Light Bullet
		
	particle_lightBullet = part_type_create();
	p = particle_lightBullet
	part_type_shape(p,pt_shape_line);
	part_type_size(p,0.50,0.50,0,0);
	part_type_color2(p,c_ltgray,c_white);
	part_type_alpha3(p,0.65,0.5,0);
	part_type_speed(p,0.10,0.10,0,0);
	part_type_direction(p,265,275,0,0);
	part_type_orientation(p,90,90,0,0,0);
	part_type_life(p,20,20);
	
	#endregion
	#region Shadow Bullet
		
	particle_shadowBullet = part_type_create();
	p = particle_shadowBullet
	part_type_shape(p,pt_shape_line);
	part_type_size(p,0.50,0.50,0,0);
	part_type_color2(p,c_purple,c_black);
	part_type_alpha3(p,0.65,0.5,0);
	part_type_speed(p,0.10,0.10,0,0);
	part_type_direction(p,265,275,0,0);
	part_type_orientation(p,90,90,0,0,0);
	part_type_life(p,20,20);
	
	#endregion
}