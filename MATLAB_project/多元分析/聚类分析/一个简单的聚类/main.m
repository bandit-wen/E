%% �������
%% Y=pdist(X,��metric��)���á�metric��ָ���ķ����������X�ж����ľ�
% �롣��metric���������ַ���ֵ��
%              �ַ���                                  �� ��
%           ��Euclid��                         ŷ�Ͼ��루ȱʡ��
%           ��SEuclid��                       ��׼ŷ�Ͼ���
%           ��Mahal��                 ���Ͼ��루Mahalanobis���룩
%           ��CityBlock��                     ����ֵ����
%           ��Minkowski��           ���Ͼ��루Minkowski���룩
%% linkage
% Z=linkage(Y)ʹ����̾����㷨���ɾ߲�νṹ�ľ��������������YΪpdist����
% ����� m*(m-1)/2 ά������������
% Z=linkage(Y,��method��)ʹ���ɡ�method��ָ�����㷨�������ɾ�����
% �ַ���  �� ��
% ��single�� ��̾��루ȱʡ��
% ��complete�� ������
% ��average�� ƽ������
% ��centroid�� ���ľ���
% ��ward�� ���ƽ���ͷ�����Ward������
%% cluster
% T=cluster(Z,cutoff)�����������linkage���д������ࡣcutoffΪ����cluster
% ����������ɾ������ֵ���䲻ͬ��ֵ�������4��ʾ��
% 0<cutoff<2
% cutoff��Ϊ��һ��ϵ������ֵ����һ��ϵ���Ծ������ж����Ĳ�
% ����������������һ�����ӵĲ�һ��ϵ��������ֵ����cluster
% ����������Ϊ�������ı߽硣
% 2<=cutoff  cutoff��Ϊ�����ھ������е���������
%% zsore(X)   �����ݾ�����б�׼������
%% H��dendrogram(Z,P)
% ��linkage���������ݾ���Z��������״ͼ��P�ǽ������Ĭ��ֵ��30��
%% T=clusterdata(X,cutoff)
% ������X�����ݷ��ࡣXΪ n m�� ���󣬱����� m ����СΪ n ���������������¼���
% ����ȼۣ�
% Y=pdist(X,��euclid��)
% Z=linkage(Y,��single��)
% T=cluster(Z,cutoff)
%% squareform   ��pdist�����ת��Ϊ����
%% cophenet
% c=cophenet(Z,Y) �������ϵ�������ǽ�Z�еľ�����Ϣ����linkage()����������
% ��Y�еľ�����Ϣ����pdist()�������������бȽϡ�
%% ����
clc,clear
a=[1,0;1,1;3,2;4,3;2,5];
y=pdist(a,'cityblock');
yc=squareform(y);
z=linkage(y);
[h,t]=dendrogram(z);
