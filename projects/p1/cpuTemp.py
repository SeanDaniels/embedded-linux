#!/usr/bin/env python3
import os, subprocess, shlex
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from gpiozero import CPUTemperature
from time import sleep, strftime, time
import datetime as dt

# Turn interactive mode on
fig = plt.figure()
fig.tight_layout(h_pad=4)
# What object is this?
temperatureAx = fig.add_subplot(2,1,1)
# And this?
freqAx = fig.add_subplot(2,1,2)
frequencyCommand = "cpufreq-info -f"
frequencyCommandArgs = shlex.split(frequencyCommand)
xTemp = []
yTemp = []
xFreq = []
yFreq = []
yValues = [yTemp, yFreq]
animateRunTime = []

# Shows cpu temperature
# Need to add frequency
# Need to add voltage
# Adding frequency now
def getFrequency():
    data, temp = os.pipe()
    os.close(temp)
    s = subprocess.check_output(frequencyCommandArgs, stdin=data)
    freqValue = int(s.decode("utf-8"))
    return freqValue

def animateTemperaturePlot(i, x, y):
    animateStart = time()
    currentTemp = CPUTemperature().temperature
    x.append(dt.datetime.now().strftime('%H:%M:%S'))
    y.append(currentTemp)
    x = x[-20:]
    y = y[-20:]
    temperatureAx.clear()
    temperatureAx.plot(x,y)
    temperatureAx.set_ylabel('Temperature (deg C)')
    temperatureAx.grid(True)

def animateFreqPlot(i,x,y):
    animateStart = time()
    currentFreq = getFrequency()
    x.append(dt.datetime.now().strftime('%H:%M:%S'))
    y.append(currentFreq/1000000)
    x = x[-20:]
    y = y[-20:]
    freqAx.clear()
    freqAx.plot(x,y)
    freqAx.set_ylabel('Frequency (MHz)')
    freqAx.grid(True)

aniTemp = animation.FuncAnimation(fig, animateTemperaturePlot, fargs=(xTemp,yTemp), interval=1000)
aniFreq = animation.FuncAnimation(fig, animateFreqPlot, fargs=(xFreq,yFreq), interval=1000)
plt.show()
