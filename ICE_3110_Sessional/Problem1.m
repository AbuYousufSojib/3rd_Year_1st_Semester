
clc;
close all;
n0=-10:10;
x=(n0>=0)==1;
subplot(3,1,1);
stem(n0,x);
title('Unit Step Signal');
xlabel('Discrete Time');
ylabel('Amplitude');
x1=(n0==0)==1;
subplot(3,1,2);
stem(n0,x1);
title('Unit Impulse Signal');
xlabel('Discrete Time');
ylabel('Amplitude');
x2=((n0>=1)==1).*n0;
subplot(3,1,3);
stem(n0,x2);
title('Ramp Signal');
xlabel('Discrete Time');
ylabel('Amplitude');

