clear
clc 
% 读入状态转移概率矩阵 
p=[0.2000 0.4667 0.3333;0.5385 0.1538 0.3077;0.3636 0.4545 0.1818];
% 读入初始状态概率向量（2004 年的农业收成状态） 
x=[0,1,0];
% 预测今后 11 年（即 2005－2015）的农业收成状态  
for i=1:11,     
    y=x*p^i;
    y
end 
