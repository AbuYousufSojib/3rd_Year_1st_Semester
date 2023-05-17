clc;
close all;
%analog Signal
dt=0.00005;
t=-0.005:dt:0.05;
xa=exp(-1000*abs(t));
subplot(2,1,1);
plot(t*1000,xa);
title('Analog Signal');
xlabel('t in sec');
ylabel('Xa(t)');
%Continuous Time Fourier Transform
Wmax=2*pi*2000;
K=500;
k=0:1:K;
W=k*Wmax/K;
xal=xa*exp(-1i*t'*W)*dt;
xal=real(xal);
W=[-fliplr(W),W(2:501)];
xal=[fliplr(xal),xal(2:501)];
subplot(2,1,2);
plot(W/(2*pi*1000),xal*1000);
title('Continuous Time Fourier Transform');
xlabel('t in sec');
ylabel('Xa(t)');