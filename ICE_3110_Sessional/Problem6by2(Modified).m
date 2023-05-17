clc;
close all;
disp('For left shift enter negetive value');
disp('For right shift enter positive value');
k=input('Enter the shifting value: ');
n=-2:2;
x=[-2,3,0,1,5];
subplot(2,1,1);
stem(n,x);
title('Main Signal');
xlabel('n---');
ylabel('x(n)');

n1=(n+k);
subplot(2,1,2);
stem(n1,x);
title('Shifted Signal');
xlabel('n---');
ylabel('x(n)');