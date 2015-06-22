#require "Bullwinkle.class.nut:1.0.0"
#require "Si702x.class.nut:1.0.0"

bull <- Bullwinkle();

// Configure the Si7021 hardware
i2c <- hardware.i2c89;
i2c.configure(CLOCK_SPEED_400_KHZ);
tempHumid <- Si702x(i2c);

// When we get a 'temp' message
bull.on("temp", function(message, reply){
    // Read the data
    local data = tempHumid.read();
    // Send a reply with the data
    reply(data)
});
