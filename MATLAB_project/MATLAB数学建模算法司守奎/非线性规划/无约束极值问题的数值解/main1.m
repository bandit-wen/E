%%�ֱ�����fminunc��fminsearch��Сֵ
%Ŀ�꺯����x^3-y^3+3*x^2+3*y^2-9*x
clear
clc
%% fminunc����
%���ú������,fminunc��Сֵ
f=@ (x) x(1)^3-x(2)^3+3*x(1)^2+3*x(2)^2-9*x(1);
g=@ (x) -f(x);
[xy,z]=fminunc(f,rand(2,1));
fprintf('%s%f\n%s%f\n%s%f\n','��ֵ���xΪ��',xy(1),...
    '��ֵ���yΪ',xy(2),'��ֵ���zΪ',z)
%fminunc�󼫴�ֵ
[xy,z]=fminunc(g,rand(2,1));
fprintf('%s%f\n%s%f\n%s%f\n\n\n\n','��ֵ���xΪ��',xy(1),...
    '��ֵ���yΪ',xy(2),'��ֵ���zΪ',-z)

%% fminsearch����
%���ú������,fminsearch��Сֵ
f=@ (x) x(1)^3-x(2)^3+3*x(1)^2+3*x(2)^2-9*x(1);
g=@ (x) -f(x);
[xy,z]=fminsearch(f,rand(2,1));
fprintf('%s%f\n%s%f\n%s%f\n','��ֵ���xΪ��',xy(1),...
    '��ֵ���yΪ',xy(2),'��ֵ���zΪ',z)
%fminsearch�󼫴�ֵ
[xy,z]=fminsearch(g,rand(2,1));
fprintf('%s%f\n%s%f\n%s%f\n','��ֵ���xΪ��',xy(1),...
    '��ֵ���yΪ',xy(2),'��ֵ���zΪ',-z)