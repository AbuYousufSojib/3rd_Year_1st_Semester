clc;
close all;
A=input('Enter the amplitude of the Transmitting Signal: ');
%Transmitting Signal

f=50;
T=1/f;
t=0:T/100:2*T;
y=A*sin(2*pi*f*t);
subplot(4,1,1);
plot(t,y,'r','linewidth',3);
title('Transmitting Signal');
xlabel('Time');
ylabel('Amplitude');

%sampling
n=1:1:40;
y1=A*sin(2*pi*f*(0.001)*n);
subplot(4,1,2);
stem(n,y1);
title('Discrete-Time Signal after sampling');
xlabel('Time(sec)');
ylabel('Amplitude(volt)');

%DC level+ Discrete-Time
y2=A+y1;
subplot(4,1,3);
stem(n,y2);
title('DC level+ Discrete-Time');
xlabel('Time(sec)');
ylabel('Amplitude(volt)');

%Quantization
y3=round(y2);
subplot(4,1,4);
stem(n,y3);
title('Quantized Signal');
xlabel('Time(sec)');
ylabel('Amplitude(volt)');

%coding
y4=dec2bin(y3);
disp('Binary Information');
disp(y4);
ylabel('Binary Information');

