% This code is for VMC calculation
clc;
clear;
l1=0.01;
l2=0.1;
l3=0.18;
M = 3.088;
g = 9.81;
angle=pi;
I_x = 7.0768703 *10^(-2);
D = 0.3504;
k1 = 200;
k2 = 100;
c1 = 40;
c2 = 5;
coef=-((l2*sin(angle)*(l1-l2*cos(angle)))/(sqrt(l3^2-(l1-l2*cos(angle))^2))+l2*cos(angle))*0.5;
