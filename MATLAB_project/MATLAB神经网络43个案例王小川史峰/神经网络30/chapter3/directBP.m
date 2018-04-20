%% δ���Ŵ��㷨�Ż���BP�����罨ģ
clear;
clc;
%%%%%%%%%%%%%�������%%%%%%%%%%%%%%
N=2000;            %�����ܸ���
M=1500;            %ѵ������
%%%%%%%%%%%%%ѵ������%%%%%%%%%%%%%%
for i=1:N
    input(i,1)=-5+rand*10;
    input(i,2)=-5+rand*10;
end
output=input(:,1).^2+input(:,2).^2;
save data input output
 
load data.mat
 
%��1��N�������
k=rand(1,N);
[m,n]=sort(k);
%�ҳ�ѵ�����ݺ�Ԥ������
input_train=input(n(1:M),:)';
output_train=output(n(1:M),:)';
input_test=input(n((M+1):N),:)';
output_test=output(n((M+1):N),:)';
%���ݹ�һ��
[inputn,inputs]=mapminmax(input_train);
[outputn,outputs]=mapminmax(output_train);
%����BP������
net=newff(inputn,outputn,5);
net.trainParam.epochs=100;
net.trainParam.lr=0.1;
net.trainParam.goal=0.0000004;
%BP������ѵ��
net=train(net,inputn,outputn);
%����������һ��
inputn_test=mapminmax('apply',input_test,inputs);
%BP������Ԥ��
an=sim(net,inputn_test);
%%����õ����ݷ���һ��
BPoutput=mapminmax('reverse',an,outputs);
 
figure(1)
%plot(BPoutput,':og');
scatter(1:(N-M),BPoutput,'rx');
hold on;
%plot(output_test,'-*');
scatter(1:(N-M),output_test,'o');
legend('Ԥ�����','�������','fontsize',12);
title('BP����Ԥ�����','fontsize',12);
xlabel('����','fontsize',12);
xlabel('�Ż�ǰ��������','fontsize',12);
 
figure(2)
error=BPoutput-output_test;
plot(1:(N-M),error);
xlabel('����','fontsize',12);
ylabel('�Ż�ǰ��������','fontsize',12);
%save net net inputs outputs