close;
clear;
clc;
%% ���ݴ���
point=[0 0;0 1;4 4;4 5;5 4;5 5;1 0];%������
dis=pdist(point,'cityblock');%�����
%% ��С�������
figure;
Z1=linkage(dis,'single');
subplot(1,2,1);
[H,T]=dendrogram(Z1,'colorthreshold','default');
set(H,'LineWidth',2);
grid on;
xlabel('x');
ylabel('y');
title('��̾��뷨����ͼ')
%% ���������
Z2=linkage(dis,'complete');
subplot(1,2,2);
[H,T]=dendrogram(Z2,'colorthreshold','default');
set(H,'LineWidth',2);
grid on;
xlabel('x');
ylabel('y');
title('����뷨����ͼ')

