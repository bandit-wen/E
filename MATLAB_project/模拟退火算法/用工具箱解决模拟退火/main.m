options=saoptimset('MaxIter',3000,'InitialTemperature',100);
[x,fval]=simulannealbnd(@ras,[0,0],[],[],options);
fprintf('%s%f%f%s%f\n','���Ž��ǣ�(',x(1),x(2),')��Ӧ�ĺ���ֵΪ��',fval);