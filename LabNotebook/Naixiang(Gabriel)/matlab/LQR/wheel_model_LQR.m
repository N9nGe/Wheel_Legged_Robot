clc
clear
% model parameter Initialization
m=0.174;                     %wheel mass
M=3.848;                       %body mass
r=0.03;              %wheel redius
I=1.4741*10^(-4);        %wheel moment of inertia
l=0.152;             %The distance between the body’s center of mass and the rotation axis of the wheel motor
Jy=3.7049207*10^(-2);      %The moment of inertia of the body rotated around the y-axis.
g=9.81;                     %The acceleration due to the gravity measured.
D=0.3504;             %The distance between the left and right wheels.
Jz=6.563965*10^(-2);      %The moment of inertia of the body rotated around the z-axis.
Jx=7.0768703*10^(-2);       %The moment of inertia of the body rotated around the x-axis.

% state space params initialization
a=r*(M+2*m+2*I/(r^2));
b=M*r*l;
c=Jy+M*l^2;
d=M*g*l;
e=M*l;
f=1/(r*(m*D+I*D/(r^2)+2*Jz/D));
A23=-b*d/(a*c-b*e);
A43=a*d/(a*c-b*e);
B21=(c+b)/(a*c-b*e);
B22=(c+b)/(a*c-b*e);
B41=-(e+a)/(a*c-b*e);
B42=-(e+a)/(a*c-b*e);
B61=f;
B62=-f;
%state matrix A
A=[0 1  0  0 0 0;
   0 0 A23 0 0 0;
   0 0  0  1 0 0;
   0 0 A43 0 0 0;
   0 0  0  0 0 1;
   0 0  0  0 0 0]  
% input matrix
B=[0 0;B21 B22;0 0;B41 B42;0 0;B61 B62] 

% whether the system is controllable
Co=ctrb(A,B);
if(rank(Co)==6)
    disp('controllable');
else
    disp('not controllable');
end

% whether the system is stable without controller
[V,D]=eig(A);
y=diag(D)                               %eigenvalue of A

%LQR controller
Q=[1   0     0    0      0     0;
   0 20000   0    0      0     0;
   0   0   90000  0      0     0;
   0   0     0    1      0     0;
   0   0     0    0    20000   0;
   0   0     0    0      0     0];     %Q matrix, Pitch angle, Yaw angle, wheel angular velocity
R=[1500 0;0 1500];                     %R matrix
K=lqr(A,B,Q,R);                        

V=1;      % target speed (max 1m/s)
Yaw=0;  % target yaw (max pi/6 rad)
