%% �������㷨
function val= Romberg(f) 
%��������:
%f�Ǳ�������,����f=@(x)sin(x)/x
%val�ǻ��ֽ��
low=input('�������������low=');
high=input('�������������high=');
e=input('�����뾫��e=');
M=1;%������
error=999;
k=0;
T=[];%�������
h=high-low;
% T(1,1)=h/2*(feval(f,low)+feval(f,high));
T(1,1)=h/2*(1+feval(f,high));%����sin(0)/0
while error>e
    k=k+1;
    h=h/2;
    temp=0;
    for i=1:M
        x=low+h*(2*i-1);
        temp=temp+feval(f,x);
    end
    T(k+1,1)=T(k,1)/2+h*temp;
    M=2*M;
    for j=1:k
        T(k+1,j+1)=T(k+1,j)+(T(k+1,j)-T(k,j))/(4^j-1);
    end
    error=abs(T(k+1,j+1)-T(k,j));
end
val=T(k+1,k+1);
fprintf('%s%f','���ֽ��Ϊ��',val);
