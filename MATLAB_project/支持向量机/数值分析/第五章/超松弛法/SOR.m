%% ���ɳڷ�
function val=SOR(A,b,x0)
%A��ϵ������
%b�ǳ�������
%x0�ǳ�ʼֵ
%% �㷨ʵ��
w=input('�������ɳ�����w=');
e=input('�����뾫��e=');
step=input('��������������step=');
if(w<=0 || w>=2)
    disp('�ɳ����ӵķ�ΧӦΪ��0,2��');
    return;
end
D=diag(diag(A));    %��A�ĶԽǾ���
L=tril(A,-1);      %��A����������
U=triu(A,1);       %��A����������

B=inv(D+L*w)*((1-w)*D-w*U);
f=w*inv((D+L*w))*b;
val=B*x0+f;
n=1;                  %��������

while norm(val-x0)>=e
    x0=val;
    val =B*x0+f;
    n=n+1;
    if(n>=step)
        disp('Warning: ��������̫�࣬���ܲ�������');
        return;
    end
end
disp('�õ��Ľ����£�')
val