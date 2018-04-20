%% ��˹��Ԫ����Ԫ
function x=GaussMain(A,b)
%A��ϵ������A=[2 -1 3;4 2 5;1 2 0];
%b�ǳ���b=[1;4;7];
%x�ǽ�
%����A=[10^(-5) 1;1 1];b=[1;2];
N = size(A);
n = N(1);
index = 0;
for i=1:(n-1)
    me = max(abs(A(1:n,i)));       %ѡȡ����Ԫ
    for k=i:n
        if(abs(A(k,i))==me)
            index = k;             %��������Ԫ���ڵ���
            break;
        end
    end
    temp = A(i,1:n);
    A(i,1:n) =  A(index,1:n);
    A(index,1:n) = temp;
    bb = b(index);
    b(index)=b(i);
    b(i) = bb;
    step=A(i,i);%�Խ���Ԫ��
    while(step==0)
        if(i==n)
            fprintf('%c(%d)%s','x',n,'�������κ���');
        end
        step=A(i,:);
        A(i,:)=A(n,:);
        A(n,:)=step;
    end
    step=A(i,i);
    b(i)=b(i)/A(i,i);
    A(i,:)=A(i,:)/A(i,i);
    for j=(i+1):n
        ss=A(j,i);
        A(j,:)=A(j,:)-A(i,:)*ss;
        b(j)=b(j)-b(i)*ss;
    end
end
for i=n:-1:1
    s=0;
    for j=i+1:n
        s=s+A(i,j)*x(j);
    end
    x(i)=(b(i)-s)/A(i,i);
end
disp('������Ľ�Ϊ��');
for i=1:length(x)
    disp(x(i));
end

