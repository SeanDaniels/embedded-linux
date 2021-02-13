#!/usr/bin/env python3
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from gpiozero import CPUTemperature
from time import sleep, strftime, time
import datetime as dt

# Turn interactive mode on
plt.ion()
fig = plt.figure()
ax = fig.add_subplot()
x = []
y = []

def animate(i, x: list, y: list) -> None:
    currentTemp = CPUTemperature()
    x.append(dt.datetime.now().strftime('%H:%M:%S.%F'))
    y.append(currentTemp)
    x = x[-20:]
    y = y[-20:]
    ax.clear()
    ax.plot(x,y)

ani = animation.FuncAnimation(fig, animate, fargs=(x,y), interval=1000)
plt.show()
