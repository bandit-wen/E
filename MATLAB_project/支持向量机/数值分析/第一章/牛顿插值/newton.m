%% ţ�ٲ�ֵ��ʽ
function [f,val]=newton(x,y,x0)
%x����֪���ݵĺ�����
%y����֪���ݵ�������
%x0�Ǵ���ֵ��ĺ�����
%f�ǵõ��Ķ���ʽ
%val�ǲ�ֵ���
%% �㷨ʵ��
if length(x)~=length(y)
    disp('�������ά�Ȳ����');
    return;
end
syms X;
len=length(x);
f=y(1);%f(x0)
y1=[];
L=1;
for i=1:len-1
    for j=i+1:len
        y1(j)=(y(j)-y(i))/(x(j)-x(i));%���̱��j��
    end
    temp(i)=y1(i+1);
    L=L*(X-x(i));
    f=f+temp(i)*L;
    simplify(f);
    y=y1;
end
f=matlabFunction(f);
val=feval(f,x0);
fprintf('%s%f%s%f\n','��ֵ����ʽΪ��',func2str(f),'��ֵ���Ϊ��',val);