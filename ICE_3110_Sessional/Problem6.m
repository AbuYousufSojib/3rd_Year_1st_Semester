clc;
close all;
n1=-2:1;
x1=[1,2,3,4];
subplot(4,1,1);
stem(n1,x1);
title('n1,x1 Signal');
xlabel('Time');
ylabel('Amplitude');

n2=0:3;
x2=[1,1,1,1];
subplot(4,1,2);
stem(n2,x2);
title('n2,x2 Signal');
xlabel('Time');
ylabel('Amplitude');

n=min(min(n1),min(n2)):max(max(n1),max(n2));
y1=zeros(1,length(n));
y2=y1;
y1(((n>=min(n1)) & (n<=max(n1)))==1)=x1;
y2(((n>=min(n2)) & (n<=max(n2)))==1)=x2;
y=y1.*y2;
subplot(4,1,3);
stem(n,y);
title('Multiplied Signal');