#!/usr/bin/python3

import RPi.GPIO as gpio
import time
import requests

pin = 14 
stopped = True
basePath = "http://localhost:8080/dicer/"

def on_pushdown():
    if(stopped):
        result = requests.post(basePath + "start")
        print(result)
        stopped = False
    else:
        result = requests.post(basePath + "stop")
        print(result)
        stopped = True


try:
    # Setting GPIO layout
    gpio.setmode(gpio.BCM)
    # Set pin as input pin pulled down to GND
    gpio.setup(pin, gpio.IN, pull_up_down=gpio.PUD_DOWN)

    while True:
        if not 'event' in locals():
            event = gpio.add_event_detect(pin, gpio.RISING, callback=on_pushdown, bouncetime=500)
        else:
            time.sleep(1)

finally:  
    gpio.cleanup()