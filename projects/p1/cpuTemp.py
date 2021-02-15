#!/usr/bin/env python3
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from gpiozero import CPUTemperature
from time import sleep, strftime, time
import datetime as dt

# Turn interactive mode on
fig = plt.figure()
ax = fig.add_subplot(1,1,1)
x = []
y = []

def animate(i, x, y):
    animateStart = time()
    currentTemp = CPUTemperature().temperature
    x.append(dt.datetime.now().strftime('%H:%M:%S.%F'))
    y.append(currentTemp)
    x = x[-20:]
    y = y[-20:]
    ax.clear()
    ax.plot(x,y)
    plt.xticks(rotation=45, ha='right')
    plt.subplots_adjust(bottom=0.30)
    plt.title('Temperature Over Time')
    plt.ylabel('Temperature (deg C)')
    print("Function runtimed: {}".format(time()-animateStart))

ani = animation.FuncAnimation(fig, animate, fargs=(x,y), interval=1000)
plt.show()
