%% �䲽�����η��㷨
function val = changeT(f)
%f�Ǻ���
%e�Ǿ���
%% �㷨ʵ��
low=input('�������������:low=');
x=low;
flow=eval(f);
% flow=1;%sin(0)/0=1
high=input('�������������:high=');
x=high;
fhigh=eval(f);
e=input('�����뾫ȷ��:e=');
h=high-low;
T1=h*(flow+fhigh)/2;
%����ͼ��do-whiel��ʽ
S=0;
x=low+h/2;
S=S+eval(f);
x=x+h;
while x<high
    S=S+eval(f);
    x=x+h;
end
T2=T1/2+S*h/2;
while abs(T2-T1)>=e
    h=h/2;
    T1=T2;
    S=0;
    x=low+h/2;
    S=S+eval(f);
    x=x+h;
    while x<high
        S=S+eval(f);
        x=x+h;
    end
    T2=T1/2+S*h/2;
end
val=T2;
fprintf('%s%f\n','�䲽�����η��Ľ���ǣ�',val);