function yfit=kyf2(a,x) %��������������һ��m�ļ�
x=x(:);
yfit=a(1).*x.^6+a(2).*x.^5+a(3).*x.^4+a(4).*x.^3+a(5).*x.^2+a(6).*x+a(7);
yfit=yfit';