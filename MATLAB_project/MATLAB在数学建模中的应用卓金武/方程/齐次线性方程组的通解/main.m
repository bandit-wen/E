%% ������Է������ͨ��
A=[1 2 2 1;2 1 -2 -2;1 -1 -4 -3];
format rat
B=null(A,'r');%����B=rref(A);
syms k1 k2
X=k1*B(:,1)+k2*B(:,2)
pretty(X)