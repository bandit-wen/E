%% ����������z=100*(x(i)-y(i)^2)^2+(y(i)-1)^2;����Сֵ
clear
clc

%������ʼ��
x_range=[-50,50];%����x�仯��Χ
y_range=[-50,50];%����y�仯��Χ
range=[x_range;y_range];%�����仯����
Max_V=0.2*(range(:,2)-range(:,1));%����ٶ�
n=2;%����ά��

%�㷨����
PSOparams=[25 2000 24 2 2 0.9 0.4 1500 1e-25 250 NaN 0 0];

%% ����ȺѰ��
pso_Trelea_vectorized('test_func',n,Max_V,range,0,PSOparams)
