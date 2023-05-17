clc;
close all;
n=-2:10;
x=[1:7,6:-1:1];
[n1,x1]=shift(n,x,5);
[n2,x2]=shift(n,x,-4);
[n3,x3]=add(n1,n2,2*x1,(-3)*x2);
stem(n3,x3);
title('The desired sequence');
xlabel('Time');
ylabel('Amplitude');

function[p,q]=shift(n,x,val)
p=n+val;
q=x;
end
function[p,q]=add(n1,n2,x1,x2)
p=min(min(n1),min(n2)):max(max(n1),max(n2));
y1=zeros(1,length(p));
y2=y1;
y1((p>=min(n1))&(p<=max(n1))==1)=x1;
y2((p>=min(n2))&(p<=max(n2))==1)=x2;
q=y1+y2;
end