s = rng(5,'v5normal');
mu = round((rand(3,2)-0.5)*19)+1;
sigma = round(rand(3,2)*40)/10+1;
X = [mvnrnd(mu(1,:),sigma(1,:),200); ...
     mvnrnd(mu(2,:),sigma(2,:),300); ...
     mvnrnd(mu(3,:),sigma(3,:),400)];
% ��ͼ
P1 = figure;clf;
scatter(X(1:200,1),X(1:200,2),10,'r*');
hold on;
scatter(X(201:500,1),X(201:500,2),10,'g*');
scatter(X(501:900,1),X(501:900,2),10,'y*');
title('�о�����ɢ��ֲ�ͼ')
% �����ô�ͳŷʽ���룬�ֳ�����
% cidx2               N*1���������洢����ÿ����ľ�����
% cmeans2         K*P�ľ��󣬴洢����K����������λ��
% sumd2             1*K�ĺ��������洢����������е���������ĵ����֮��
% D2                   N*K�ľ��󣬴洢����ÿ�������������ĵľ���
[cidx2,cmeans2,sumd2,D2] = kmeans(X,3,'dist','sqEuclidean');
plot(cmeans2(:,1),cmeans2(:,2),'ko');
% gcf���ͼ�εľ��
% gco��ô�ʱ�������Ԫ�صľ��
% gca���������ľ��
% get(gca,'children')�������ͼ���л�����ͼ�ߵľ��
set(get(gca,'Children'),'LineWidth',2);%����ͼ�е�ͼ��Ŀ��
P2 = figure;clf;
%����ĺ�������ͼ�����Ƿ���ĸ��ʣ������Ƿ�������
[silh2,h2] = silhouette(X,cidx2,'sqeuclidean');
