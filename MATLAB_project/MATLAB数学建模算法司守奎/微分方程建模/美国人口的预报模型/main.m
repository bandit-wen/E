%% Logistic人口模型
%% 方法一：非线性最小二乘的参数估计
t=1790:10:2000;
t=t';
x=[3.9 5.3 7.2 9.6 12.9 17.1 23.2 31.4 28.6 50.2 62.9 76 92 106.5 123.2 131.7 150.7 179.3 204 226.5 251.4 281.4];
x=x';
t0=t(1);
x0=x(1);
fun=@(cs,td) cs(1)./(1+(cs(1)/x0-1)*exp(-cs(2)*(td-t0)));
cs=lsqcurvefit(fun,rand(2,1),t(2:end),x(2:end),zeros(2,1));
val=feval(fun,cs,[t;2010]);
