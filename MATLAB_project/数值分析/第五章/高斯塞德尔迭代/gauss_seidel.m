%% ��˹-���¶�����
function val=gauss_seidel(A,b,x0)
%A��ϵ������
%b�ǳ�������
%x0�ǳ�ʼֵ
%% �㷨ʵ��  
e=input('�������ľ���e��');
step=input('����������������step:');
D=diag(diag(A));    %��A�ĶԽǾ���
L=tril(A,-1);      %��A����������
U=triu(A,1);       %��A����������
G=-(D+L)\U;
f=(D+L)\b;
val=G*x0+f;
n=1;                  %��������
while val-x0>e
    x0=val;
    val=G*x0+f;
    n=n+1;
    if(n>=step)
        disp('Warning: ��������̫�࣬���ܲ�������');
        return;
    end
end
disp('�õ��Ľ����£�')
val
