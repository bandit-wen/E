%% �������㷨���̽���
% �㷨���̣�
%
%1����ջ������� 
%     close��clear��clc��
%
%2�����ѡ�������ѵ�����ݺ�Ԥ�����ݲ���һ��
% ������������������ΪN,��������ΪP��������ΪT;
% ÿһ����һ��������ÿһ����һ������
% temp=randperm(N);
% input_train=P(temp(1:2/3*N),:)';(�������ݵ�2/3~3/4Ϊ��)
% output_train=T(temp(1:2/3*N),:)';
% input_test=P(temp(2/3*N:end),:)';
% output_test=T(temp(2/3*N:end),:)';
% �����ĸ��������յ�ÿ����һ�����ԣ�ÿһ����һ������;
% N = size(input_test,2);���ڼ������ϵ��R^2
% [input_train,inputps]=mapminmax(input_train);
% [output_train,outputps]=mapminmax(output_train);

% 3����������
% net = feedforwardnet (10,'trainlm')
% ��������10����Ԫ��ѵ��������trainlm 
% 
% 4�������������
% net.trainParam.show=1000;               %1000�ֻ���ʾһ�ν��
% net.divideParam.trainRatio=0.8;����ѵ�����ݵı���
% net.divideParam.valRatio=0.1;���ڼ������ݵı���
% net.divideParam.testRatio=0.1;���ڲ������ݵı���
% net.trainParam.epochs = 1000;���ѵ������
% net.trainParam.goal = 1e-3;��С��������ѵ��Ŀ��
% net.trainParam.lr = 0.01;ѧϰ����
% 
% 5��ѵ������
% net = train(net,input_train,output_train);BP����
% net = newrbe(input_train,output_train,0.3);RBF����

% 6������������һ����������ԣ����ڼ���ģ��Ч����,�������һ��
% input_test=mapminmax('apply',input_test,inputps);
% res = sim(net,input_test);
% res=mapminmax('reverse',res,outputps);
% output_test=mapminmax('apply',output_test,outputps);
% 
% 7����������Ч��
% ������error
% error_bp = abs(res - output_test)./output_test;
% ����ϵ��R^2
% R2_bp = (N * sum(res .* output_test) - sum(res) * sum(output_test))^2 / ((N * sum((res).^2) - (sum(res))^2) * (N * sum((output_test).^2) - (sum(output_test))^2)); 

