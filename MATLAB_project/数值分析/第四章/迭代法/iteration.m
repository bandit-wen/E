%% �������󷽳̵ĸ�
function val=iteration(f)
%f�Ǵ�����ĺ���
%% �㷨��ʵ��
x0=input('�����������㣺x0=');
e=input('�����������Ľ�ľ��ȣ�e=');
N=input('����������������N=');
val=9999;
for i=1:N
    x1=feval(f,x0);
    if abs(x1-x0)<e
        val=x1;
        return;
    else
        x0=x1;
    end
end
fprintf('%s%f','��������ǣ�',val);