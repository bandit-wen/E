%% ���ݴ���
% dataʹ���������ݣ����е�һ������ϰ�г����
% �ڶ��е������ǳ���ʱ��͵���ʱ��
% �����е������ǳ�������͵�������
close
clear 
clc
data=deal();
%% ��ÿ������ʱ��(�ڶ�����ʼ)����ʮ�������תƵ���ʾ��� 
% ddata�ǰ�ʱ���ź���Ľ��
ddata=sortrows(data,2);
time=360:15:1410;
border=[];%�������ÿ��ʱ��ε����޵�����ֵ
index=1;
for i=1:length(time)-1
    temp=find(ddata(:,2)>time(i))-1;
    border(i)=temp(1);
end
num=diff(border)-1;
num(find(num<0))=0;
figure(1)
plot(1:length(num),num)
hold on
a=175*ones(1,length(num));
plot(1:length(num),a,'r')
plot(1:length(num),num,'k*')
title('��ʱ����ڵ�����ʹ��������ͼ');
xlabel('ʱ���');
ylabel('������ʹ����');
hold off;
%% �����360-519     519-647     647-1410����ʱ���
for i=1:length(border)-1%ÿ��ʱ��γ�ȥ����
    for j=1:10
        pnum(i,j)=length(find(ddata(border(i)+1:border(i+1),4)==j));
    end
end
for j=1:10
        pnum(length(border),j)=length(find(ddata(border(length(border)):end,4)==j));
end
figure(2)
for i=1:10
    plot(1:length(border),pnum(:,i));
    hold on;
end
title('��ʱ����ڸ����򵥳���ȥ����ͼ');
xlabel('ʱ���');
ylabel('������ȥ��');
%ÿ��ʱ��ν�������
for i=1:length(border)-1%ÿ��ʱ��γ�ȥ����
    for j=1:10
        pnum(i,j)=length(find(ddata(border(i)+1:border(i+1),5)==j));
    end
end
for j=1:10
        pnum(length(border),j)=length(find(ddata(border(length(border)):end,5)==j));
end
figure(3)
for i=1:10
    plot(1:length(border),pnum(:,i));
    hold on;
end
title('��ʱ����ڸ����򵥳���������ͼ');
xlabel('ʱ���');
ylabel('����������');
%% ����ʱ��ε�״̬ת�ƾ���360-519     519-647     647-1410
% ddata(1,:)-ddata(2200,:)     ddata(2201,:)-ddata(4263,:)
% ddata(4264,:)-ddata(end,:)
% p1p2p3�Ǹ��ʵ�״̬ת�ƾ���
begin=[100 109 90 99 106 102 90 120 91 93];
for i=1:10
    for j=1:10
        pp1(i,j)=length(find(ddata(1:2200,4)==i&ddata(1:2200,5)==j));
    end
end
for i=1:10
    for j=1:10
        pp2(i,j)=length(find(ddata(2201:4263,4)==i&ddata(2201:4263,5)==j));
    end
end
for i=1:10
    for j=1:10
        pp3(i,j)=length(find(ddata(4264:end,4)==i&ddata(4264:end,5)==j));
    end
end
for i=1:10
    for j=1:10
        if pp1(i,j)==0
            p1(i,j)=(sum(pp1(:,j))+begin(j)-sum(pp1(i,:)))/(sum(pp1(:,j))+begin(j));
        else
            p1(i,j)=pp1(i,j)/(begin(i)+sum(pp1(:,i)));
        end
    end
end
for i=1:10
    for j=1:10
        if pp2(i,j)==0
            p2(i,j)=(sum(pp2(:,j))+begin(j)-sum(pp2(i,:)))/(sum(pp2(:,j))+begin(j));
        else
            p2(i,j)=pp2(i,j)/(begin(i)+sum(pp2(:,i)));
        end
    end
end
for i=1:10
    for j=1:10
        if pp3(i,j)==0
            p3(i,j)=(sum(pp3(:,j))+begin(j)-sum(pp3(i,:)))/(sum(pp3(:,j))+begin(j));
        else
            p3(i,j)=pp3(i,j)/(begin(i)+sum(pp3(:,i)));
        end
    end
end
ttime=360:5:1410;
statu=zeros(10,length(ttime));
for i=1:33
    statu(:,i)=(begin*p1^i)';
end
for i=1:26
    statu(:,i+33)=(statu(:,33)'*p2^i)';
end
for i=1:152
    statu(:,i+59)=(statu(:,59)'*p3^i)';
end
figure(4)
for i=1:10
    plot(1:211,statu(i,:));
    hold on
end
p=zeros(10,3);
for i=1:33
    p(:,1)=p(:,1)+statu(:,i)*5.*diag(p1);
end
for i=1:26
    p(:,2)=p(:,2)+statu(:,i+33)*5.*diag(p2);
end
for i=1:152
    p(:,3)=p(:,3)+statu(:,i+59)*5.*diag(p3);
end








