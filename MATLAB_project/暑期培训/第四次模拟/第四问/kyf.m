function yfit=kyf(a,x) %��������������һ��m�ļ�
x=x(:);
yfit=a(1)*exp(-((x-a(2))/a(3)).^2)+a(4)*exp(-((x-a(5))/a(6)).^2);
yfit=yfit';