function yfit=kyf3(a,x) %��������������һ��m�ļ�
x=x(:);
yfit=a(1).*x.^2+a(2).*x+a(3);
yfit=yfit';