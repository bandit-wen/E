clear;
clc;
X=[0 1 2 3 4 5 6 7 8 9 10];D=[0 1 2 3 4 3 2 1 2 3 4];
figure;
plot(X,D,'*');%����ԭʼ���ݷֲ�ͼ?
net=newff([0 10],[5 1],{'tansig','purelin'})
net.trainParam.epochs=100;
net.trainParam.goal=0.005;
net=train(net,X,D);
O=sim(net,X);
figure;
plot(X,D,'*',X,O);%����ѵ����õ��Ľ�����������
V=net.iw{1,1}%����㵽�м��Ȩֵ?
theta1=net.b{1}%�м�����Ԫ��ֵ?
W=net.lw{2,1}%�м�㵽�����Ȩֵ?
theta2=net.b{2}%��������Ԫ��ֵ