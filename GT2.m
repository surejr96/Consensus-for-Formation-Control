clear all
close all
clc
%A Matrix - Adja
A=[0 1 1 0 0;0 0 0 1 0;0 0 0 0 1;0 0 0 0 0;0 0 0 0 0];
A
%D Matrix - sum of rows
D=[2 0 0 0 0;0 2 0 0 0;0 0 2 0 0;0 0 0 0 0;0 0 0 0 0];
D
L=D-A
x0=5*rand(5,1);
y0=5*rand(5,1);
theta=2*pi*rand(5,1);
w0=[x0;y0;theta];
time=[0,20];
[t,w]=ode23(@veh,time,w0);
x=[w(1) w(2) w(3) w(4) w(5)]';
y=[w(6) w(7) w(8) w(9) w(10)]';
theta=[w(11) w(12) w(13) w(14) w(15)]';
figure
plot(t,w(:,11:15))
xlabel('time(in seconds)');
ylabel('State Values');
grid on
legend("node 1","node 2","node 3","node 4","node 5")
figure
plot(w(:,1:5),w(:,6:10))

[REG,Eval1,LEG11]=eig(L)
plot (real(Eval1),imag(Eval1),'*b');
grid on;
xlabel("REAL PART")
ylabel("IMAGINARY PART")

function w=veh(t,w)
%A Matrix - Adja
A=[0 1 1 0 0;0 0 1 1 0;0 1 0 0 1;0 0 0 0 1;0 0 0 1 0];
A
%D Matrix - sum of rows
D=[2 0 0 0 0;0 2 0 0 0;0 0 2 0 0;0 0 0 1 0;0 0 0 0 1];
D

L=D-A
theta=w(11:15);
thetadot= -L*theta;
xdot= sin(theta);
ydot= cos(theta);
w=[xdot;ydot;thetadot]
end
