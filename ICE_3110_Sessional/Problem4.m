clc;
close all;
n1=-5;
n2=5;
n=n1:n2;
[p1,q1]=shifting(n1,n2,-2);
[p2,q2]=shifting(n1,n2,4);
y=((2*q1)-q2);
figure(1);
stem(n,y);
title('The desired sequence');
xlabel('n--->');
ylabel('Amplitude');

function[n,y]=shifting(n1,n2,n0)
n=n1:n2;
y=(n-n0)==0;
end
