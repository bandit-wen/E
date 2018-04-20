function [output_fore,err_rate] = nn(k,n,attribute,res,train_num,innum,midnum,outnum,xite,ssum)
%�����ֱ������Ծ��󣬷�����������ѵ��������Ŀ������ڵ㣬
%�м�ڵ㣬����ڵ㣬ѧϰ��
%% �������������
data=attribute;
%% �����������
input=data;
output1=res;
%�������1ά���4ά
for i=1:ssum
    switch output1(i)
        case 0
            output(i,:)=[1 0];
        case 1
            output(i,:)=[0 1];
    end
end
%% �����ȡ260������Ϊѵ��������86������ΪԤ������
input_train=input(n(1:train_num),:)';
output_train=output(n(1:train_num),:)';
input_test=input(n(train_num+1:ssum),:)';
output_test=output(n(train_num+1:ssum),:)';
%% �������ݹ�һ��
[inputn,inputps]=mapminmax(input_train);
%% Ȩֵ��ʼ��
w1=rands(midnum,innum);
b1=rands(midnum,1);
w2=rands(midnum,outnum);
b2=rands(outnum,1);
w2_1=w2;w2_2=w2_1;
w1_1=w1;w1_2=w1_1;
b1_1=b1;b1_2=b1_1;
b2_1=b2;b2_2=b2_1;
%% ����ѵ��
for ii=1:10
    E(ii)=0;
    for i=1:1:train_num
       %% ����Ԥ����� 
        x=inputn(:,i);
        % ���������
        for j=1:1:midnum
            I(j)=inputn(:,i)'*w1(j,:)'+b1(j);
            Iout(j)=1/(1+exp(-I(j)));
        end
        % ��������
        yn=w2'*Iout'+b2;
       %% Ȩֵ��ֵ����
        %�������
        e=output_train(:,i)-yn;     
        E(ii)=E(ii)+sum(abs(e));
        %����Ȩֵ�仯��
        dw2=e*Iout;
        db2=e';
        for j=1:1:midnum
            S=1/(1+exp(-I(j)));
            FI(j)=S*(1-S);
        end      
        for k=1:1:innum
            for j=1:1:midnum
                dw1(k,j)=FI(j)*x(k)*(e(1)*w2(j,1)+e(2)*w2(j,2));
                db1(j)=FI(j)*(e(1)*w2(j,1)+e(2)*w2(j,2));
            end
        end
        w1=w1_1+xite*dw1';
        b1=b1_1+xite*db1';
        w2=w2_1+xite*dw2';
        b2=b2_1+xite*db2';
        w1_2=w1_1;w1_1=w1;
        w2_2=w2_1;w2_1=w2;
        b1_2=b1_1;b1_1=b1;
        b2_2=b2_1;b2_1=b2;
    end
end
%% ����
inputn_test=mapminmax('apply',input_test,inputps);
for ii=1:1
    for i=1:(ssum-train_num)
        %���������
        for j=1:1:midnum
            I(j)=inputn_test(:,i)'*w1(j,:)'+b1(j);
            Iout(j)=1/(1+exp(-I(j)));
        end
        fore(:,i)=w2'*Iout'+b2;
    end
end
%% �������
%������������ҳ�������������
for i=1:(ssum-train_num)
    output_fore(i)=find(fore(:,i)==max(fore(:,i)))-1;
end
%BP����Ԥ�����
error=output_fore-output1(n(train_num+1:ssum))';
err_num=length(find(error~=0));
err_rate=err_num/(ssum-train_num);
