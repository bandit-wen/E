%% ����׼��
close
clear
clc
load pp.mat%pp��һ����10*10��������������
load infor.mat
load statu.mat
data=deal();
clc
data=sortrows(data,2);%data��11649*5����Ϣ����
index1=find(data(:,2)==519.03);%�ڶ�ʱ�ε���ʼ��
index2=find(data(:,2)==647.02);%����ʱ�ε���ʼ��
%% �����߷�ǰ��ʱ�̵ĳ����ֲ�
begin=[100 109 90 99 106 102 90 120 91 93];
status=begin+sum(pp1)-sum(pp1');
status=status+statu;
status=status./2;
%% �Ŵ��㷨���ʼ��
resx=zeros(1,10);
resx=GA_myd();
%% �����Ҫ���˵ĳ�����
disp(['ʵ�ʻ�����Ϊ��',num2str(status)]);
disp(['���������Ϊ��',num2str(resx)]);
need=resx-status;
outindex=find(need<0);
outnum=need(outindex);
inindex=find(need>0);
innum=need(inindex);
%% �����������֮�����е�ʱ����Ϊ·��
time=zeros(10,10);
for i=1:10
    for j=1:10
        pindex=find(data(:,4)==i&data(:,5)==j);
        ptime=sum(data(pindex,3)-data(pindex,2))/length(pindex);
        time(i,j)=ptime;
    end
end
% time=time+diag(-diag(time));
time=tril(time,-1)+triu(time,1);%�Խ��߸�ֵΪ0
time=round(time);
disp(['�����Ļ�����Ϊ��',num2str(outnum)]);
disp(['����������Ϊ��',num2str(outindex)]);
disp(['����Ļ�����Ϊ��',num2str(innum)]);
disp(['���������Ϊ��',num2str(inindex)]);
%% �����Ž�
disp('---------------------------------------------------------------------')
disp('���䷽�����£�')
i=1;j=1;
while i<=length(outnum)&&j<=length(innum)
    if outnum(i)+innum(j)<0
        disp([num2str(outindex(i)),'->',num2str(inindex(j)),'(',num2str(abs(innum(j))),')']);
        outnum(i)=outnum(i)+innum(j);
        j=j+1;
    elseif outnum(i)+innum(j)==0
        disp([num2str(outindex(i)),'->',num2str(inindex(j)),'(',num2str(abs(innum(j))),')']);
        i=i+1;
        j=j+1;
    else
        disp([num2str(outindex(i)),'->',num2str(inindex(j)),'(',num2str(abs(outnum(i))),')']);
        innum(j)=outnum(i)+innum(j);
        i=i+1;
    end
end



