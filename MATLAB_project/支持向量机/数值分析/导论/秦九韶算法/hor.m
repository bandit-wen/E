function val=hor(x)
%% �����ؾ����㷨��Դ����
%������ʽΪ:val=hor(x)
%valΪ���ý��
%xΪ�Ա�����ֵ

%% �㷨ʵ��
len=input('���������ʽ������������');
p=zeros(1,len+1);%p���ϵ��
fprintf('%s\n','�밴�����ɵ͵����������ϵ����');
for i=1:len+1
    p(i)=input('');
end
fprintf('%s','P=')
for i=1:len+1
    if i~=len+1
        fprintf('%s%f%s%f%s','(',p(i),')x^',i-1,'+')
    else
        fprintf('%s%f%s%f\n','(',p(i),')x^',i-1)
    end
end
index=find(p~=0);
index=sort(index,'descend');%ϵ����Ϊ0������±�
X=index-1;%ϵ����Ϊ0����Ĵ���
times=length(index)-1;%�������x^i
xi=p(index(1));
ci=X(1);
for ii=1:times
    ci=min(ci,X(ii+1));%�ϲ��������д�����С��
    xi=xi*x^(X(ii)-ci)+p(index(ii+1));%�����ϵ����
end
val=xi*x^(ci);
fprintf('%s%f%s%f\n','����ʽ��x=',x,'����ֵΪ',val);