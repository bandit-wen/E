%% �ſ˱ȵ�����
function val=jacobi(A,b,x0)
%A��ϵ������,�磺A=[10 -1 -2;-1 10 -2;-1 -1 5];
%b�ǳ�������,�磺b=[7.2;8.3;4.2];
%x0�ǳ�ʼֵ
%% �㷨ʵ��
e=input('�������ľ���e��');
step=input('����������������step:');
D=diag(diag(A));    %��A�ĶԽǾ���,diagһ���������������Ǿ���
L=tril(A,-1);      %��A����������
U=triu(A,1);       %��A����������
G=-D\(L+U);     %ֻ��������ҳ������
f=D\b;
val=G*x0+f;
n=1;                  %��������

while (val-x0)>e
    x0=val;
     val=G*x0+f;
    n=n+1;
    if(n>=step)
        disp(' �����������������ܲ�������');
        return;
    end
end
disp('�õ��Ľ����£�');
val

