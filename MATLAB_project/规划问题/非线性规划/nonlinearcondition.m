function [f,ceq] = nonlinearcondition(x)
f = - x(1)^2 + x(2);
ceq = - x(1) - x(2)^2 + 2;             %�����Ե�ʽԼ��