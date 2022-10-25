partType = obj_main.particle_ea_standard
		
emitter = part_emitter_create(global.particle_system);
part_emitter_stream(global.particle_system,emitter,partType,1);

image_xscale = 2
image_yscale = 2