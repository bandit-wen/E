 %%  Ŀ�꺯����100*(x2-x1^2)^2+(1-x1)^2;
 f=@ (x) 100*(x(2)-x(1)^2)^2+(1-x(1))^2;
 
 [xy,z]=fminunc(f,rand(2,1));
 fprintf('%s%f\n%s%f\n%s%f\n\n\n','��ֵ���xΪ��',xy(1),...
    '��ֵ���yΪ',xy(2),'��ֵ���zΪ',z);

 [xy,z]=fminsearch(f,rand(2,1));
 fprintf('%s%f\n%s%f\n%s%f\n','��ֵ���xΪ��',xy(1),...
    '��ֵ���yΪ',xy(2),'��ֵ���zΪ',z);
