function yfit=kyf1(a,x) %��������������һ��m�ļ�
x=x(:);
yfit=a(1)+(a(2)-x)/a(2)*a(3).*x;
yfit=yfit';