close;
clear;
clc;
%% 2015
num15=xlsread('2015');%14*9
%����ָ��ȥ�������Ұ�����ָ�껮��һ�µĴ�С��Χ��
c15=topsis(num15);
%% 2014
num14=xlsread('2014');
c14=topsis(num14);
%% 2013
num13=xlsread('2013');
c13=topsis(num13);