%% ��һ��
close;
clear;
clc;
%% ��������
%num1��ʽ:γ�ȣ����ȣ������ۣ�ִ�����
[num1,txt1,raw1]=xlsread('1.xls');
%num2��ʽ:γ�ȣ����ȣ�����ʼʱ�䣬����ֵ
[num2,txt2,raw2]=xlsread('2.xlsx');
%num3��ʽ:γ�ȣ�����
[num3,txt3,raw3]=xlsread('3.xls');
%��ȡ������γ�Ⱦ��Ⱥͻ�Ա��γ��
missionlatlon=num1(:,1:2);
memberlatlon=num2(:,1:2);
%����γ��ת��Ϊֱ������
axesm utm   %����ͶӰ��ʽ��
Z=utmzone(missionlatlon);%����latlon���������ѡ����ʵ�ͶӰ����
setm(gca,'zone',Z);
h = getm(gca);
R=zeros(size(missionlatlon));
for i=1:length(missionlatlon)
    [x,y]= mfwdtran(h,missionlatlon(i,1),missionlatlon(i,2)); %�������ת��
    x=x/1000;
    y=y/1000;
    R(i,:)=[x;y];
end
xlswrite('missioncoordinate.xlsx',R,1,'A1');
figure;
axesm utm   %����ͶӰ��ʽ��
ZZ=utmzone(missionlatlon);%����latlon���������ѡ����ʵ�ͶӰ����
setm(gca,'zone',ZZ);
hh = getm(gca);
RR=zeros(size(memberlatlon));
for i=1:length(memberlatlon)
    [xx,yy]= mfwdtran(hh,memberlatlon(i,1),memberlatlon(i,2)); %�������ת��
    xx=xx/1000;
    yy=yy/1000;
    RR(i,:)=[xx;yy];
end
xlswrite('membercoordinate.xlsx',RR,1,'A1');
%% ��ͼ:��Ա������ķֲ�ͼ
%����λ��(R)�Ǻ�ɫ����Աλ��(RR)����ɫ��
figure;
plot(RR(:,1),RR(:,2),'go','linewidth',2); %��ֱ�������»�����Щ̨վ
xlabel('γ��ת������');
ylabel('����ת������');
title('��Աλ��ͼ');
figure;
plot(R(:,1),R(:,2),'r*','linewidth',1); %��ֱ�������»�����Щ̨վ
xlabel('γ��ת������');
ylabel('����ת������');
title('����λ��ͼ');
% axis([0 1200000 0 4000000]);
hold off;
figure;
plot(RR(:,1),RR(:,2),'mo','linewidth',2);
hold on;
plot(R(:,1),R(:,2),'c*','linewidth',1);
hold off;
axis([680 870 2450 2650]);
xlabel('γ��ת������');
ylabel('����ת������');
title('���񡢻�Ա��Ⱥλ��ͼ');
legend('��Ա','����');
close figure 1;
close figure 2;
%% ����άͼ������ľ���γ�ȣ����꣬������
figure;
indexfinished=find(num1(:,4)==1);
indexunfinished=find(num1(:,4)==0);
x=R(indexfinished,1);
y=R(indexfinished,2);
z=num1(indexfinished,3);
xx=R(indexunfinished,1);
yy=R(indexunfinished,2);
zz=num1(indexunfinished,3);%���
scatter3(x,y,z,'go','linewidth',2);
hold on;
scatter3(xx,yy,zz,'ro','linewidth',2);%δ���
xlabel('γ��');
ylabel('����');
zlabel('����');
title('����λ�á����꼰������ɢ��ͼ');
legend('�����','δ���');
%% ��ͼ:�۸�������3�����������Ĺ�ϵ
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(RR,1));%������������
for i=1:size(R,1)
    for j=1:size(RR,1)
        distance(i,j)=sqrt((R(i,1)-RR(j,1))^2+(R(i,2)-RR(j,2))^2);
    end
end
path=0;
peo=zeros(1,length(mon));
for k=1:length(mon)
    pindex=find(num1(:,3)==mon(k));%ÿһ��������
    for i=1:size(pindex,1)
        index=find(distance(pindex(i),:)<3);%ÿһ������3��������
        peo(k)=peo(k)+length(index);
    end
    peo(k)=peo(k)/length(pindex);
end
figure;
plot(mon,peo,'o');
title('�۸�������3�����������Ĺ�ϵ(ʵ��)');
xlabel('����');
ylabel('����������������');
figure;
x1=65:80;
y1=2.398*10^11*exp(-0.3522*x1);
plot(x1,y1);
hold on;
x2=80:85;
y2=4.46*10^9*exp(-0.2424*x2);
plot(x2,y2);
hold off;
title('�۸�������3�����������Ĺ�ϵ(���)');
xlabel('����');
ylabel('����������������');
%% �۸�������3�������������Ĺ�ϵ
mon=unique(num1(:,3));
ddistance=zeros(size(R,1),size(R,1));%������������
for i=1:size(R,1)
    for j=1:size(R,1)
        ddistance(i,j)=sqrt((R(i,1)-R(j,1))^2+(R(i,2)-R(j,2))^2);
    end
end
path=0;
peo=zeros(1,length(mon));
for k=1:length(mon)
    pindex=find(num1(:,3)==mon(k));%ÿһ��������
    for i=1:size(pindex,1)
        index=find(ddistance(pindex(i),:)<3);%ÿһ������3����������
        peo(k)=peo(k)+length(index);
    end
    peo(k)=peo(k)/length(pindex);
end
figure;
plot(mon,peo,'o');
title('�۸�������3�������������Ĺ�ϵ');
ylabel('������������������');
xlabel('����');
figure;
x1=65:80;
y1=7446000*exp(-0.206*x1);
plot(x1,y1);
hold on;
plot(mon,peo,'o');
x2=80:85;
y2=6556*exp(-0.08499*x2);
plot(x2,y2);
hold off;
title('�۸�������3�������������Ĺ�ϵ');
ylabel('������������������');
xlabel('����');
%% �۸�������3�������˵������ȵĹ�ϵ
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(RR,1));%������������
for i=1:size(R,1)
    for j=1:size(RR,1)
        distance(i,j)=sqrt((R(i,1)-RR(j,1))^2+(R(i,2)-RR(j,2))^2);
    end
end
path=0;
peo=zeros(1,length(mon));
for k=1:length(mon)
    pindex=find(num1(:,3)==mon(k));%ÿһ��������
    for i=1:size(pindex,1)
        index=find(distance(pindex(i),:)<3);%ÿһ������3��������
        for j=1:length(index)
            peo(k)=peo(k)+num2(index(j),4);
        end
    end
    peo(k)=peo(k)/length(pindex);
end
figure;
plot(mon,peo,'o');
title('�۸�������3������������ֵ�Ĺ�ϵ');
xlabel('������������������ֵ');
ylabel('����');
figure;
x1=65:80;
y1=3.932*10^18*exp(-0.5188*x1);
plot(x1,y1);
hold on;
x2=80:85;
y2=3.591*10^23*exp(-0.579*x2);
plot(x2,y2);
hold off;
%% �۸�������3�������˵Ŀɽ��������Ĺ�ϵ
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(RR,1));%������������
for i=1:size(R,1)
    for j=1:size(RR,1)
        distance(i,j)=sqrt((R(i,1)-RR(j,1))^2+(R(i,2)-RR(j,2))^2);
    end
end
path=0;
peo=zeros(1,length(mon));
for k=1:length(mon)
    pindex=find(num1(:,3)==mon(k));%ÿһ��������
    for i=1:size(pindex,1)
        index=find(distance(pindex(i),:)<3);%ÿһ������3��������
        for j=1:length(index)
            peo(k)=peo(k)+num2(index(j),5);
        end
    end
    peo(k)=peo(k)/length(pindex);
end
figure;
plot(mon,peo,'o');
title('�۸�������3�������˿ɽ��������Ĺ�ϵ');
xlabel('�������������˵Ŀɽ�������');
ylabel('����');
% x1=mon(1:21);
% x2=mon(22:23);
% y1=peo(1:21);
% y2=peo(22:23);
figure;
x1=65:80;
y1=1.69*10^12*exp(-0.3529*x1);
plot(x1,y1);
hold on;
x2=80:85;
y2=1.594*10^9*exp(-0.2084*x2);
plot(x2,y2);
hold off;
%% �̶��������������������ѶȽ׶Σ�����Ӱ������
%������
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(RR,1));%������������
for i=1:size(R,1)
    for j=1:size(RR,1)
        distance(i,j)=sqrt((R(i,1)-RR(j,1))^2+(R(i,2)-RR(j,2))^2);
    end
end
xy=zeros(1,size(R,1));
for i=1:size(R,1)
    index=find(distance(i,:)<3);%ÿ������3��������
    for j=1:length(index)
        xy(i)=xy(i)+num2(index(j),4);
    end
    xy(i)=xy(i)/length(index);
end
index=find(isnan(xy)==1);
xy(index)=0;
%������
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(RR,1));%������������
for i=1:size(R,1)
    for j=1:size(RR,1)
        distance(i,j)=sqrt((R(i,1)-RR(j,1))^2+(R(i,2)-RR(j,2))^2);
    end
end
js=zeros(1,size(R,1));
for i=1:size(R,1)
    index=find(distance(i,:)<3);%ÿ������3��������
    for j=1:length(index)
        js(i)=js(i)+num2(index(j),5);
    end
    js(i)=js(i)/length(index);
end
index=find(isnan(js)==1);
js(index)=0;
%��Χ������
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(RR,1));%������������
for i=1:size(R,1)
    for j=1:size(RR,1)
        distance(i,j)=sqrt((R(i,1)-RR(j,1))^2+(R(i,2)-RR(j,2))^2);
    end
end
rs=zeros(1,size(R,1));
for i=1:size(R,1)
    index=find(distance(i,:)<3);%ÿ������3��������
    rs(i)=length(index);
end
index=find(isnan(rs)==1);
rs(index)=0;
%��Χ��������
mon=unique(num1(:,3));
distance=zeros(size(R,1),size(R,1));%������������
for i=1:size(R,1)
    for j=1:size(R,1)
        distance(i,j)=sqrt((R(i,1)-R(j,1))^2+(R(i,2)-R(j,2))^2);
    end
end
rw=zeros(1,size(R,1));
for i=1:size(R,1)
    index=find(distance(i,:)<3);%ÿ������3��������
    rw(i)=length(index);
end
index=find(isnan(rw)==1);
rw(index)=0;
feature=[xy' js' rs' rw' num1(:,4)];
figure;
plot(1:835,feature(:,1)','r');
figure;
plot(1:835,feature(:,2)','y');
figure;
plot(1:835,feature(:,3)','g');
figure;
plot(1:835,feature(:,4)','k');
figure;
plot(1:835,feature(:,5)','b');









