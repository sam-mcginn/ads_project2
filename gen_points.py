#! /usr/bin/python3
from math import sin, cos, pi

x = lambda t: cos(t) - 1.0
y = lambda t: sin(t)

for i in range(200):
    t = 2*pi*i/200
    c_x = x(t)
    c_y = y(t)
    print(f'{i} => ads_cmplx(to_ads_sfixed({c_x}), to_ads_sfixed({c_y})),')
