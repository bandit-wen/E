%% ţ����ɽ��
function val=NewtonDown(f,alpha)
% fΪ���������
% alphaΪ��ɽ����
%% �㷨ʵ��
begin=input('��������ʼ�㣺begin=');
e=input('�����뾫��:e=');
error=1;
temp=func2str(f);%ת���������Ϊ�ַ���
temp=temp(5:length(temp));
syms x
fun=diff(temp,x);
fun=matlabFunction(fun);
val=begin;
while(error>e)
    r1=val;
    fx=feval(f,r1);
    dfx=feval(fun,r1);
    val=r1-alpha*fx/dfx;
    error=abs(val-r1);
end
fprintf('%s%f','���̵Ľ��Ƹ�Ϊ��',val);
