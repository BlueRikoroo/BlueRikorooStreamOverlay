subImg += imageSpeed

x += (dest[0] - x) * 0.1
y += (dest[1] - y) * 0.1

if abs(dest[0]-x) < 2 and abs(dest[1]-y) < 2{
	instance_destroy()	
}