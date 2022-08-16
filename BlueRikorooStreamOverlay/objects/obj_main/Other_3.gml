ini_open("Config/config.ini")

ini_write_string("Carryover", "lastMap", currentMap)
ini_write_real("Carryover", "lastOverlay", currentOverlay)

ini_close()