close;
clear;
clc;
%% ���ݴ���
point=[0 0;0 1;4 4;4 5;5 4;5 5;1 0];%������
%% c-��ֵ����
figure;
[U,P,Dist,Cluster_Res,Obj_Fcn,iter]=fuzzycm(point,2,1);