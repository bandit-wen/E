function yfit=kyf4(a,x) %��������������һ��m�ļ�
x=x(:);
yfit=a(1).*exp(a(2).*x) + a(3).*exp(a(4).*x);
yfit=yfit';