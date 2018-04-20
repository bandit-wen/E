%% �ȶԶ�Ԫ�����ֱ���ƫ���������Hessian��
%   �����פ�㴦��Hessian��Ϊ��������Ϊ��Сֵ
%   �����פ�㴦��Hessian��Ϊ��������Ϊ����ֵ
%   �����פ�㴦��Hessian��Ϊ���������Ǽ�ֵ��
clear
close 
clc
%������ű��������г�Ŀ�꺯��
syms x y
f=x^3-y^3+3*x^2+3*y^2-9*x;
%�ֱ���һ��ƫ����
df=jacobian(f);%��һ��ƫ����
d2f=jacobian(df);%��Hessian��
[xx,yy]=solve(df);%��פ��
xx=double(xx);
yy=double(yy);
for i=1:length(xx)
    a=subs(d2f,{x,y},{xx(i),yy(i)});
    b=eig(a);%����������ֵ
    f=subs(f,{x,y},{xx(i),yy(i)});
    f=double(f);
    if all(b>0)
        fprintf('(%f,%f)�Ǽ�Сֵ�㣬��Ӧ�ļ�Сֵ��%f\n',xx(i),yy(i),f);
    elseif all(b<0)
        fprintf('(%f,%f)�Ǽ���ֵ�㣬��Ӧ�ļ���ֵ��%f\n',xx(i),yy(i),f);
    elseif any(b>0)&any(b<0)
        fprintf('(%f,%f)���Ǽ�ֵ��\n',xx(i),yy(i));
    else
        fprintf('�޷��жϣ�%f,%f���Ƿ��Ǽ�ֵ��',xx(i),yy(i));
    end
end