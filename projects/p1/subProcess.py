#!/usr/bin/env python3

import os, sys

a = 'mkdir nwdir'
b = os.popen(a, 'r', 1)

print(b)
