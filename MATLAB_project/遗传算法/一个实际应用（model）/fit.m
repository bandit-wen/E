function z=fit(x,y)
%��Ӧ�Ⱥ���
%x--40�鰴Ŀ��ֵ�Ĵ�СԤ�������Ӧ��
%y--40���Ա���������y1,y2...y9��
for i=1:40
    if abs(sum(y(i,:))-500)>5
        x(i)=0.001*x(i);
    end
end
z=x;
