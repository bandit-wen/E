%% �������󷽳̵ĸ�
function val=Aitken(f)
%f�Ǵ�����ĺ���
%%�㷨��ʵ��
x0=input('�����������㣺x0=');
e=input('�����������Ľ�ľ��ȣ�e=');
N=input('����������������N=');
for i=1:N
    x1=feval(f,x0);
    x2=feval(f,x1);
    x2=x2-(x2-x1)^2/(x2-2*x1+x0);
    if abs(x2-x0)<e
        val=x2;
        return;
    else
        x0=x2;
    end
end
fprintf('%s%f','��������ǣ�',val);