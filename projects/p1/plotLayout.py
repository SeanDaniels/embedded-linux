#!/usr/bin/env python3
import matplotlib.pyplot as plt
fig, ax = plt.subplots(2,1)
fig.tight_layout(h_pad=2)

#define subplot titles
ax[0].set_title('First Subplot')
ax[1].set_title('Second Subplot')
# ax[1, 0].set_title('Third Subplot')
# ax[1, 1].set_title('Fourth Subplot')

#add overall title and adjust it so that it doesn't overlap with subplot titles
fig.suptitle('Overall Title')
plt.subplots_adjust(top=0.85)

#display subplots
plt.show()
