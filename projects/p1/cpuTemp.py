#!/usr/bin/env python3
import os
import subprocess
import shlex
import matplotlib.pyplot as plt
import matplotlib.animation as animation
from gpiozero import CPUTemperature
from time import sleep, strftime, time
import datetime as dt

plotInterval = 1000

fig, ax = plt.subplots(2, 2)
fig.tight_layout(w_pad=4, h_pad=4)
temperatureAx = ax[0, 0]  # fig.add_subplot(2,2,1)
freqAx = ax[1, 0]  # fig.add_subplot(2,2,3, sharex=temperatureAx)
frequencyCommand = "cpufreq-info -f"
voltageFreqAx = ax[0, 1]  # fig.add_subplot(2,2,2)
temperatureFreqAx = ax[1, 1]  # fig.add_subplot(2,2,2)
# need temperature vs frequency
# need voltage vs frequency

voltageCommand = "vcgencmd measure_volts core"
frequencyCommandArgs = shlex.split(frequencyCommand)
voltageCommandArgs = shlex.split(voltageCommand)
timeValues = []
temperatureValues = []
frequencyValues = []
voltageValues = []
animateRunTime = []
animateTemperatureRuntime = []
# Shows cpu temperature
# Need to add frequency
# Need to add voltage
# Adding frequency now


def getFrequency():
    data, temp = os.pipe()
    os.close(temp)
    s = subprocess.check_output(frequencyCommandArgs, stdin=data)
    freqValue = float(s.decode("utf-8"))
    return freqValue


def getVoltage():
    data, temp = os.pipe()
    os.close(temp)
    s = subprocess.check_output(voltageCommandArgs, stdin=data)
    commandOutput = s.decode("utf-8")
    commandOutput = commandOutput[5:-2]
    voltage = float(commandOutput)
    return voltage


def animateTemperaturePlot(i, timeAxis, freq, voltage, temp):
    global animateTemperatureRuntime
    animateTemperaturePlotRuntimeStart = time()
    currentTemp = CPUTemperature().temperature
    timeAxis.append(dt.datetime.now().strftime('%H:%M:%S'))
    temp.append(currentTemp)
    timeAxis = timeAxis[-20:]
    temp = temp[-20:]
    temperatureAx.clear()
    temperatureAx.plot(timeAxis, temp)
    temperatureAx.set_ylabel('Temperature (deg C)')
    # temperatureAx.get_xaxis().set_visible(False)
    plt.setp(temperatureAx.get_xticklabels(), visible=False)
    temperatureAx.grid(True)

    currentFreq = getFrequency()
    freq.append(currentFreq/1000000)
    freq = freq[-20:]
    freqAx.clear()
    freqAx.plot(timeAxis, freq)
    freqAx.set_ylabel('Frequency (MHz)')
    plt.setp(freqAx.get_xticklabels(), visible=False)
    freqAx.grid(True)

    currentVolt = getVoltage()
    voltage.append(currentVolt)
    voltage = voltage[-20:]
    voltageFreqAx.clear()
    voltageFreqAx.scatter(frequencyValues, voltageValues)
    voltageFreqAx.set_ylabel('Voltage(V) vs Freq(MHz)')
    voltageFreqAx.grid(True)

    temperatureFreqAx.clear()
    temperatureFreqAx.scatter(frequencyValues, temperatureValues)
    temperatureFreqAx.set_ylabel('Temperature(C) vs Freq(MHz)')
    temperatureFreqAx.grid(True)
    # animateTemperatureRuntime.append(time()-animateTemperaturePlotRuntimeStart)
    # if len(animateTemperatureRuntime) == 10:
    #     sum = 0
    #     for entry in animateTemperatureRuntime:
    #        sum += entry
    #     avg = sum/10
    #     print("Average runtime for temperature plot: {}".format(avg))
    #     animateTemperatureRuntime.clear()


# def animateFreqPlot(i, x, y):
#     currentFreq = getFrequency()
#     y.append(currentFreq/1000000)
#     x = x[-20:]
#     y = y[-20:]
#     freqAx.clear()
#     freqAx.plot(x, y)
#     freqAx.set_ylabel('Frequency (MHz)')
#     freqAx.grid(True)
#     plt.setp(freqAx.get_xticklabels(), visible=False)


# def animateVoltageFrequencyPlot(i, x, y):
#     currentVolt = getVoltage()
#     y.append(currentVolt)
#     x = x[-20:]
#     y = y[-20:]
#     voltageFreqAx.clear()
#     voltageFreqAx.scatter(x, y)
#     voltageFreqAx.set_ylabel('Voltage(V) vs Freq(MHz)')
#     voltageFreqAx.grid(True)


# def animateTemperatureFrequencyPlot(i, x, y):
#     x = x[-20:]
#     y = y[-20:]
#     temperatureFreqAx.clear()
#     temperatureFreqAx.scatter(x, y)
#     temperatureFreqAx.set_ylabel('Temperature(C) vs Freq(MHz)')
#     temperatureFreqAx.grid(True)


aniTemp = animation.FuncAnimation(fig, animateTemperaturePlot, fargs=(timeValues, frequencyValues, voltageValues, temperatureValues), interval=plotInterval)
# aniFreq = animation.FuncAnimation(fig, animateFreqPlot, fargs=(
#     timeValues, frequencyValues), interval=plotInterval)
# aniVoltFreq = animation.FuncAnimation(fig, animateVoltageFrequencyPlot, fargs=(
#     frequencyValues, voltageValues), interval=plotInterval)
# aniTempFreq = animation.FuncAnimation(fig, animateTemperatureFrequencyPlot, fargs=(
#     temperatureValues, frequencyValues), interval=plotInterval)
plt.show()
