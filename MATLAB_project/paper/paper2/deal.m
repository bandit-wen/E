function [res,attribute]=deal()
%% ��������
[num,txt,raw]=xlsread('ͳ������.xlsx');%num�����ݾ���
%% ����ȱʧ����
[m,n]=find(isnan(num));
num(m,:)=[];
%% �ֳ�����к�������
res=num(:,3);%�����;
res=repmat(res,3,1);
attribute=num(:,10:29);%������
attribute=repmat(attribute,3,1);