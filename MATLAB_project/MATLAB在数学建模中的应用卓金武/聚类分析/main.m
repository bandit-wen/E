%% �ñ�׼�����ݾ���+ŷ�Ͼ��뷨ʵ�־������
clc
clear
close all
x=;
BX=zscore(x);
Y=pdist(x);
D=squareform(Y);
Z=linkage(Y);
[H,T]=dendrogram(Z,'colorthreshold','default');