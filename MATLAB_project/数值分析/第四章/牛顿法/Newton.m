%% ţ�ٷ��󷽳̵ĸ�
function val=Newton(f)
%f�Ǵ�������̣�����f=@(x)x*exp(x)-1
%% �㷨ʵ��
temp=func2str(f);%ת���������Ϊ�ַ���
temp=temp(5:length(temp));
syms x
df=diff(temp,x);
if df==0
    disp('����Ϊ���������뻻һ���㷨');
    return;
end
df=matlabFunction(df);%��symת��Ϊfunc
begin=input('�㷨��ʼ���ǣ�begin=');
e=input('���̵ĸ��ľ����ǣ�e=');
fbegin=feval(f,begin);
dfbegin=feval(df,begin);
val=begin-fbegin/dfbegin;
error=abs(val-begin);
while(error>e)
    temp=val;
    fx=feval(f,temp);
    dfx=feval(df,temp);
    if dfx==0
        val=-99999999;
        disp('����Ϊ0���뻻һ���㷨');
        return;
    end
    val=temp-fx/dfx;
    error=abs(val-temp);
end
% format long;
fprintf('%s%f','���̵ĸ�Ϊ��',val);


