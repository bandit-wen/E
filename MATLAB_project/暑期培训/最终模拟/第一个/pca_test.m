%% �������ɷַ���
function [p1,per1,p2,per2,p3,per3,p4,per4]=pca_test(num)
%��һ��ָ��������ɷַ���
num1=num(:,1:4);
stdr=std(num1);                %��������ı�׼�  
[n,m]=size(num1);               %�����������  
sddata=num1./stdr(ones(n,1),:);         %��׼���任  
[p1,princ1,egenvalue1]=princomp(sddata);  %�������ɷ�  
p1=p1(:,1:3);                          %���ǰ3���ɷ�ϵ����  
sc1=princ1(:,1:3);                       %ǰ3���ɷ�����  
egenvalue1;                   %���ϵ�����������ֵ���������ɷ���ռ������  
per1=100*egenvalue1/sum(egenvalue1);       %�������ɷ���ռ�ٷֱȣ�
%�ڶ���ָ��
num2=num(:,5:9);
stdr=std(num2);                %��������ı�׼�  
[n,m]=size(num2);               %�����������  
sddata=num2./stdr(ones(n,1),:);         %��׼���任  
[p2,princ2,egenvalue2]=princomp(sddata);  %�������ɷ�  
p2=p2(:,1:3);                          %���ǰ3���ɷ�ϵ����  
sc2=princ2(:,1:3);                       %ǰ3���ɷ�����  
egenvalue2;                  %���ϵ�����������ֵ���������ɷ���ռ������  
per2=100*egenvalue2/sum(egenvalue2);       %�������ɷ���ռ�ٷֱȣ� 
%������ָ��
num3=num(:,10:14);
stdr=std(num3);                %��������ı�׼�  
[n,m]=size(num3);               %�����������  
sddata=num3./stdr(ones(n,1),:);         %��׼���任  
[p3,princ3,egenvalue3]=princomp(sddata);  %�������ɷ�  
p3=p3(:,1:3);                          %���ǰ3���ɷ�ϵ����  
sc3=princ3(:,1:3);                       %ǰ3���ɷ�����  
egenvalue3;                   %���ϵ�����������ֵ���������ɷ���ռ������  
per3=100*egenvalue3/sum(egenvalue3);       %�������ɷ���ռ�ٷֱȣ�
%������ָ��
num4=num(:,15:18);
stdr=std(num4);                %��������ı�׼�  
[n,m]=size(num4);               %�����������  
sddata=num4./stdr(ones(n,1),:);         %��׼���任  
[p4,princ4,egenvalue4]=princomp(sddata);  %�������ɷ�  
p4=p4(:,1:3);                          %���ǰ3���ɷ�ϵ����  
sc4=princ4(:,1:3);                       %ǰ3���ɷ�����  
egenvalue4;                   %���ϵ�����������ֵ���������ɷ���ռ������  
per4=100*egenvalue4/sum(egenvalue4);       %�������ɷ���ռ�ٷֱȣ�