load data3_1.txt;  
[m,n]=size(data3_1);
tsx=data3_1(1:m,1);
tsx=tsx';
ts=data3_1(1:m,2);
ts=ts'; 
[TSX,TSXps]=mapminmax(tsx,1,2);
[TS,TSps]=mapminmax(ts,1,2);
TSX=TSX';  
figure; 
plot(ts,'LineWidth',2);
title('��������������(1999.01.01-2009.12.31)','FontSize',12);
xlabel('ͳ�����(1990.12.19-2009.08.19)','FontSize',12); 
ylabel('��һ��������ο���/����','FontSize',12); 
grid on;     
% ����BP���硢����minmax����������������Χ  
net_1=newff(minmax(TS),[10,1],{'tansig','purelin'},'traincgf') 
% ����ѵ������  
net_1.trainParam.show = 50; %��ʾѵ���������̣�NaN��ʾ����ʾ��ȱʡ25�� 
net_1.trainParam.lr = 0.025; %ѧϰ�ʣ�ȱʡ0.01�� 
net_1.trainParam.mc = 0.9; %�������ӣ�ȱʡ0.9)
net_1.trainParam.epochs=10000;%���ѵ������
net_1.trainParam.goal=0.001;%ѵ��Ҫ�󾫶�
inputWeights=net_1.IW{1,1}%�����Ȩֵ
inputbias=net_1.b{1}%�������ֵ
layerWeights=net_1.LW{2,1}%�����Ȩֵ
layerbias=net_1.b{2}%�������ֵ
TS',TSX
%����ѵ��??
[net_1,tr]=train(net_1,TS,TSX);