x0=[0 3 5 7 9 11 12 13 14 15];
y0=[0 1.2 1.7 2.0 2.1 2.0 1.8 1.2 1.2 1.6];
%% ����ͼ��
x=0:0.1:15;
%һ�����Բ�ֵ
y1=interp1(x0,y0,x);
%����������ֵ
y2=interp1(x0,y0,x,'spline');
%����������ֵ
pp1=csape(x0,y0);
y3=fnval(pp1,x);
%����������ֵ
pp2=csape(x0,y0,'second');
y4=fnval(pp2,x);
%����������ֵ
plot(x,y1,'k');
hold on
plot(x,y2,'r:');
plot(x,y3,'c--');
plot(x,y4,'g-.');
hold off
%% ��13,15���ڵ�ymin
index=find(y3==min(y3(131:151)));
xmin=x(index);
ymin=y3(index);