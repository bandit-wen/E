%% minf(x)=2*x(1)^2-4*x(1)*x(2)+4*x(2)^2-6*x(1)-3x(2)
%   s.t.      x(1)+x(2)<=3
%              4*x(1)+x(2)<=9
%              x(1),x(2)>=0

h=[4 -4;-4 8];
f=[-6;-3];
a=[1 1;
    4 1];
b=[3;9];
[x,fval]=quadprog(h,f,a,b,[],[],zeros(2,1));