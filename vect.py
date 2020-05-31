import numpy as np
import csv

pvec = np.loadtxt('pvec.csv',delimiter=',')
inp = np.loadtxt('input.csv' ,delimiter=',')
#perpendicular vector
x1 = pvec[0,0]
y1 = pvec[0,1]
z1 = pvec[0,2]

x2 = pvec[1,0]
y2 = pvec[1,1]
z2 = pvec[1,2]

x3 = pvec[2,0]
y3 = pvec[2,1]
z3 = pvec[2,2]

a1 = x2 - x1
a2 = y2 - y1
a3 = z2 - z1

b1 = x3 - x1
b2 = y3 - y1
b3 = z3 - z1

v1 = a2*b3 - a3*b2
v2 = a3*b1 - a1*b3
v3 = a1*b2 - a2*b1

mag = np.sqrt(v1*v1 + v2*v2 + v3*v3)

V1 = v1/mag
V2 = v2/mag
V3 = v3/mag

D = inp[0]

q = D*V1
w = D*V2
e = D*V3

#x axis vector

CC = inp[3]
DD = inp[4]
C = int(CC - 1)
D = int(DD - 1)

oi = pvec[C,0]
oj = pvec[C,1]
ok = pvec[C,2]

pi = pvec[D,0]
pj = pvec[D,1]
pk = pvec[D,2]

ti = oi - pi
tj = oj - pj
tk = ok - pk

magx = np.sqrt(ti*ti + tj*tj + tk*tk)

tx = ti/magx
ty = ti/magx
tz = ti/magx

F = inp[5]
txi = F*tx
tyi = F*ty
tzi = F*tz

#y axis vector
ux = V2*tz - V3*ty
uy = V3*tx - V1*tz
uz = V1*ty - V2*tx

G = inp[6]
uxi = G*ux
uyi = G*uy
uzi = G*uz

list=[q,w,e,txi,tyi,tzi,uxi,uyi,uzi]

with open('cross.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(list)
