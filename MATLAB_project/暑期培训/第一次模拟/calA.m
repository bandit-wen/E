function [A1,A2,A3]=calA(num15,p151,per151,p152,per152,p153,per153)
%如何计算三个一级指标的评分：当14个二级指标x是行向量时,
% 分成x1,x2,x3
num15(12:14,:)=num15(12:14,:)*100;
num=num15';%9*14matrix
x1=num(:,1:6);
x2=num(:,7:11);
x3=num(:,12:14);
z1=x1*p151;
z2=x2*p152;
z3=x3*p153;
A1=[per151(1)*z1(:,1)/100+per151(2)*z1(:,2)/100+per151(3)*z1(:,3)/100];
A2=[per152(1)*z2(:,1)/100+per152(2)*z2(:,2)/100+per152(3)*z2(:,3)/100];
A3=[per153(1)*z3(:,1)/100+per153(2)*z3(:,2)/100+per153(3)*z3(:,3)/100];