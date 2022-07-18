ini_open("Config/config.ini")

webhook_url = ini_read_string("Website", "url", "")

ini_close()

// Start recieving data if a website it inputted
if webhook_url != ""
	alarm[0] = 10