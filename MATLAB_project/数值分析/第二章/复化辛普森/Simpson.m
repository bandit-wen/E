%% ��������ɭ��ʽ
function val=Simpson(f)
% fΪ��������
%% �㷨ʵ��
low=input('�������������:low=');
% f1=1;%sin(0)/0����1
x=low;
f1=eval(f);
high=input('�������������:high=');
x=high;
f2=eval(f);
n=input('������ȷֵ���Ŀ:n=');
h=(high-low)/n;
s1=0;
s2=0;
for i=1:n-1
    x=low+i*h;
    s1=s1+eval(f);
end
for i=0:n-1
    x=low+(i+0.5)*h;
    s2=s2+eval(f);
end
S=h/6*(f1+4*s2+2*s1+f2);
fprintf('%s%f\n','����ɭ��ʽ�Ľ��Ϊ:S= ',S);