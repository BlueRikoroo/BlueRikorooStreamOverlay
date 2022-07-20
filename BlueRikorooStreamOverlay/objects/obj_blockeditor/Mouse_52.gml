/// @desc Move View
camera = view_camera[0]
var diffX = mouse_x-lastMouseX
var diffY = mouse_y-lastMouseY
camera_set_view_pos(camera, camera_get_view_x(camera)-diffX, camera_get_view_y(camera)-diffY)

lastMouseX = mouse_x
lastMouseY = mouse_y