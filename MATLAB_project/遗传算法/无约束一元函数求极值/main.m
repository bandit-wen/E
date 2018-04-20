%% ����Ϊ��Լ��Ŀ�꺯�����ֵ�Ŵ��㷨���
clear
close all
clc

%Ŀ�꺯��
figure(1)
% x=[0:0.01:2];
x=[-10:0.01:10];
% f=200*exp(-0.05*x).*sin(x);
f=2.1*(1-x+2*x.^2).*exp(-x.^2/2);
plot(x,f);

%��������
NIND=30;
MAXGEN=30;
% PRECI=(2-(-2))/0.0001;%��������㾫�ȵĽ�����Ҫ����Ϊ����
PRECI=40;
GGAP=0.95;
px=0.7;
pm=0.01;
trace=zeros(2,1);
%�����������Լ���ʼ��Ⱥ�Ĵ���
% FieldD=[PRECI;0;2;1;0;1;1];
FieldD=[PRECI;-10;10;1;0;1;1];
[Chrom,BaseV]=crtbp(50,PRECI);
%% �Ż��׶�
%������¼��
gen=0;
%����
Phen=bs2rv(Chrom,FieldD);
%����Ŀ�꺯��ֵ
% ObjV=200*exp(-0.05*Phen).*sin(Phen);
ObjV=2.1*(1-Phen+2*Phen.^2).*exp(-Phen.^2/2);
%ѭ��ģ���Ŵ�
while gen<MAXGEN
    FitnV=ranking(-ObjV);
    SelCh=select('sus',Chrom,FitnV,GGAP);
    newChrom=recombin('xovsp',SelCh,px);
    newChrom=mut(newChrom,pm);
    %�����Ӵ�����ֵ
    Phen=bs2rv(newChrom,FieldD);
%     ObjVSel=200*exp(-0.05*Phen).*sin(Phen);
ObjVSel=2.1*(1-Phen+2*Phen.^2).*exp(-Phen.^2/2);
    %���Ӵ�������븸��������
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
    Phen=bs2rv(Chrom,FieldD);
    gen=gen+1
    
    %��¼����ֵ
    [Y,I]=max(ObjV);
    trace(1,gen)=Phen(I,:);
    trace(2,gen)=Y;
end

figure(2)
plot(trace(1,:),trace(2,:),'bo')
grid on;
figure(3)
plot(1:MAXGEN,trace(2,:));
grid on;
xlabel('�Ŵ�������');
ylabel('��ı仯��');
title('�������̣�');


[bestY,num]=max(trace(2,:));
bestX=trace(1,num);

disp('���Ž⣺X=');
disp(num2str(bestX));
disp('Y=');
disp(num2str(bestY));
