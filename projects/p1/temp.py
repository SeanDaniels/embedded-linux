# Starter code based on https://projects.raspberrypi.org/en/projects/temperature-log 
# and https://github.com/raspberrypilearning/temperature-log
from gpiozero import CPUTemperature
from time import sleep, strftime, time
import matplotlib.pyplot as plt
import datetime

plt.ion() 
x = []
y = []

cpu = CPUTemperature()
t_start = time()
with open("/home/pi/cpu_temp.csv", "a") as log:
    while True:
        temp = cpu.temperature
        y.append(temp)
        x.append(time() - t_start)
        plt.clf()
        plt.plot(x,y)
        plt.pause(0.1)
        plt.show()
