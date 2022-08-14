#!/usr/bin/python3

import RPi.GPIO as gpio
import time
import requests

pin = 14 
stopped = True
basePathRaspi = "http://joni-media.local/dicer/"
basePathLaptop = "http://joni-laptop-alt/dicer/"


def on_pushdown(c):
    global stopped
    global basePathRaspi
    global basePathLaptop
    
    if(stopped):
        try:
            requests.post(basePathLaptop + "start")
        except Exception:
            print("Laptop not reachable")
        try:
            requests.post(basePathRaspi + "start")
        except Exception:
            print("Raspi not reachable")
        stopped = False
    else:
        try:
            requests.post(basePathLaptop + "stop")
        except Exception:
            print("Laptop not reachable")
        try:
            requests.post(basePathRaspi + "stop")
        except Exception:
            print("Raspi not reachable")
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