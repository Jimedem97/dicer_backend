#!/usr/bin/python3

import RPi.GPIO as gpio
import time
import requests
from threading import Thread

pin = 14 
stopped = True
basePathRaspi = "http://192.168.1.22/dicer/"
basePathLaptop = "http://192.168.1.23/dicer/"

def runLaptop(path):
    try:
        requests.post(basePathLaptop + path)
    except Exception:
         print("Laptop not reachable")

def runRaspi(path):
    try:
        requests.post(basePathRaspi + path)
    except Exception:
         print("Laptop not reachable")


def on_pushdown(c):
    global stopped
    global basePathRaspi
    global basePathLaptop
    
    if(stopped):
        Thread(target = runLaptop, args = ("start",)).start()
        Thread(target = runRaspi, args = ("start",)).start()
        stopped = False
    else:
        Thread(target = runLaptop, args = ("stop",)).start()
        Thread(target = runRaspi, args = ("stop",)).start()
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
            time.sleep(0.5)

finally:  
    gpio.cleanup()