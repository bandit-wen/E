%% �����ʽf(x)=x^3-x^2+2*x-3�����
clear
clc
%��1
x=[1 -1 2 -3];
x=roots(x);

%��2
syms x
x=solve(x^3-x^2+2*x-3);
x=vpa(x,5)

%��3
y=@(x)x^3-x^2+2*x-3;
x=fsolve(y,rand);