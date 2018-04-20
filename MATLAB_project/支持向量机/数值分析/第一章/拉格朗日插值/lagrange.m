%% �������ղ�ֵ����
function y0=lagrange(x,y,x0)
%��ֵ�ڵ�ֱ��� x, y ����
%����ֵ�������� x0 ����,�������y0Ϊ��ֵ
%% �㷨ʵ��
if length(x)~=length(y)
    disp('������ĵ�ά�Ȳ�һ��');
    return;
end
y0=zeros(1,length(x0));
n=length(x);
m=length(x0);
for i=1:m
    xx=x0(i);
    res=0.0;
    for k=1:n
        p=1.0;
        for j=1:n
            if j~=k
                p=p*(xx-x(j))/(x(k)-x(j));
            end
        end
        res=p*y(k)+res;
    end
    y0(i)=res;
end
disp('��ֵ������£�');
for index=1:m
    fprintf('%s%f%s%f%s','(',x0(index),',',y0(index),')');
end