function val=bisection(f,step)
%% ���Ƕ��ַ�����ĺ���
% step���ѭ����������ֹ��ѭ����
% fΪ���������������
%��x^3-x-1=0����f='x^3-x-1'
%% �㷨ʵ��
e=input('�������������:e=');
xlow=input('�����������������:xlow=');
x=xlow;
vallow=eval(f);
xhigh=input('�����������������:xhigh=');
x=xhigh;
valhigh=eval(f);
for i=1:step    
    if (xhigh-xlow)<e
        break;
    end
    xmid=(xlow+xhigh)/2;
    x=xmid;
    valmid=eval(f);
    if valmid*vallow<0
        xhigh=xmid;
    else
        xlow=xmid;
    end
end
val=xmid;
fprintf('%s%f%s%f%s%f%s%f','���������'...
    ,val,'�������������:[',xlow,',',xhigh,'],����Ϊ:',e);