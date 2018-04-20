%% ode45求解一阶方程y'=-2y+2x^2+2x,x属于[0,0.5],y(0)=1
yx=@(x,y) -2*y+2*x^2+2*x;
[x,y]=ode45(yx,[0,0.5],1);
res=ode45(yx,[0,0.5],1);
y2=deval(res,x);
%% 求解van der pol方程
dy=@(t,y)[y(2);1000*(1-y(1)^2)*y(2)-y(1)];
[t,y]=ode15s(dy,[0,3000],[2;0]);
