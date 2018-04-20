%% Լ����ȥ��
function x=Jordan(A,b)
%A��ϵ������A=[2 -1 3;4 2 5;1 2 0];
%b�ǳ���b=[1;4;7];
%x�ǽ�
%����A=[0 1 4;1 3 8;-5 2 9];b=[1;1;1];
%��ӦΪ:0.3158  -1.3158  0.5789
N=size(A);
n1=N(1);%����
for i=1:n1
    step=A(i,i);%�Խ���Ԫ��
    while(step==0)
        if(i==n1)
            fprintf('%c(%d)%s','x',n1,'�������κ���');
        end
        step=A(i,:);
        A(i,:)=A(n1,:);
        A(n1,:)=step;
    end
    step=A(i,i);
    A(i,:)=A(i,:)/step;
    b(i)=b(i)/step;
    for j=1:n1
        if(j~=i)
            ss=A(j,i);
            A(j,:)=A(j,:)-A(i,:)*ss;
            b(j)=b(j)-b(i)*ss;
        end
    end
end
for i=1:n1
    x(i)=b(i)/A(i,i);  %���
end
disp('������Ľ�Ϊ��');
for i=1:length(x)
    disp(x(i));
end