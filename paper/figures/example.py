""" Example figure """

import os

import matplotlib.pyplot as plt
import numpy as np
import tikzplotlib

# Data for plotting
t = np.arange(0.0, 2.0, 0.01)
s = 1 + np.sin(2 * np.pi * t)

fig, ax = plt.subplots()
ax.plot(t, s)

ax.set(xlabel='Time [s]', ylabel='Voltage [mV]',
       title='About as simple as it gets, people!')

# Write to the same filename with new extension
plot_filename = os.path.basename(__file__).replace(".py", ".tex")
tikzplotlib.save(plot_filename)
