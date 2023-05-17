clc;
close all;
n=-1:2;
x=[3,-1,0,-4];
subplot(2,1,1);
stem(n,x);
title('Main Signal');
xlabel('Time');
ylabel('Amplitude');

n2=(-1)*n;
subplot(2,1,2);
stem(n2,x);
title('Folded Signal');
xlabel('Time');
ylabel('Amplitude');