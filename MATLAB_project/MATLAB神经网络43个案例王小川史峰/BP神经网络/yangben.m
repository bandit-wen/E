% %ģ��
% p=p1';
% t=t1';    
% [pn,minp,maxp,tn,mint,maxt]=premnmx(p,t);%ԭʼ���ݹ�һ��    
% net=newff(minmax(pn),[5,1],{'tansig','purelin'},'traingdx');%minmax(pn)ȡpn����������Сֵ��[5,1]��һ����Ԫ5�����ڶ���1����'tansig','purelin'�������һ��͵ڶ����ת�ƺ�����'trainrp'����ѵ��������
% net.trainParam.show=2000; %ѵ������ 
% net.trainParam.lr=0.01; %ѧϰ��
% net.trainParam.epochs=100000;%ѵ������
% net.trainParam.goal=1e-5;%��ȷ��
% [net,tr]=train(net ,pn,tn);%����TRAINGDM�㷨��ʼѵ��BP����  
% pnew=pnew1';
% pnewn=tramnmx(pnew,minp,maxp); 
% anewn=sim(net,pnewn);%��BP������з��� 
% anew=postmnmx(anewn,mint,maxt);%��ԭ���� 
% y=anew';
%traingd?
clear;
clc;
P=[-1 -1 2 2 4;0 5 0 5 7];
T=[-1 -1 1 1 -1];
%����minmax����������������Χ?
net=newff(minmax(P),[5,1],{'tansig','purelin'},'trainrp');
%minmax(P)ȡP�������Сֵ��[5,1]��һ����Ԫ5�����ڶ���1����'tansig','purelin'�������һ��͵ڶ����ת�ƺ�����'trainrp'����ѵ��������?
net.trainParam.show=50;%�����ʾѵ������?
net.trainParam.lr=0.05;%ѧϰ�ʣ�ȱʡΪ0.01��?
net.trainParam.epochs=300;%����ѵ��������?
net.trainParam.goal=1e-5;%���þ�ȷ��?
[net,tr]=train(net,P,T);%ѵ����ʼ??
net.iw{1,1};%����Ȩֵ?
net.b{1};%������ֵ??
net.lw{2,1};%�����Ȩֵ?
net.b{2};%�������ֵ??
sim(net,P)
