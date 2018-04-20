
clc
clear
close
clc

 lbx=-10;
ubx=10;
lby=-10;
uby=10;

%%  �������忪ʼ     ׼���׶�

%�����㷨�Ĳ���ֵ
NIND=40;%��Ⱥ��С
PRECI=50;%���峤��
MAXGEN=20;%����Ŵ�����
GGAP=0.95;%����
px=0.7;%�������
pm=0.01;%�������
trace=zeros(3,MAXGEN);%���ڴ��Ѱ�Ž��

%����������
FieldD=[PRECI PRECI;lbx lby;ubx uby;1 1;0 0;1 1;1 1];
%FieldD�Ĳ����ֱ��Ǹ��峤�ȣ���������½�,����ı��뷽ʽ��
%ʹ�õĿ̶��Լ��Ƿ���������߽�

%NIND����Ⱥ������,PRECI�Ǹ��峤��,Chrom��ÿһ������ǰ50λ��x,��50λ��Y.
[Chrom,Lind,BaseV]=crtbp(NIND,PRECI*2);

%% �Ż��׶�
gen=0;

%����
XY=bs2rv(Chrom,FieldD);
X=XY(:,1);
Y=XY(:,2);

%Ŀ�꺯��ֵ
ObjV=Shubert(X,Y);

while gen<MAXGEN
    %������Ӧ��
    FitnV=ranking(ObjV);%��ʮ��������������Ӧ������
    %ѡ��
    SelCh=select('sus',Chrom,FitnV,GGAP);
    %����
    SelCh=recombin('xovsp',SelCh,px);
    %����
    SelCh=mut(SelCh,pm);
    %�Ӵ���Ŀ�꺯��ֵ
    XY=bs2rv(SelCh,FieldD);
    X=XY(:,1);
    Y=XY(:,2);

    %�Ӵ���Ŀ�꺯��ֵ
    %ObjVSel=21.5+X.*sin(4*pi*X)+Y.*sin(20*pi*Y);
    ObjVSel=Shubert(X,Y);
    
    %���Ӵ�������븸������
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
    XY=bs2rv(Chrom,FieldD);
    gen=gen+1;
   
    %��ȡ���Ž�Ĵ��ż���ֵ,����yΪ���Ž⣬iΪ���
    [Y,I]=min(ObjV);
    %��¼
    trace(1:2,gen)=XY(I,:);
    trace(3,gen)=Y;
end

figure(2);
plot3(trace(1,:),trace(2,:),trace(3,:),'bo');
hold on;
grid on;
plot3(XY(:,1),XY(:,2),ObjV,'r*');
hold off;

figure(3)
plot(1:MAXGEN,trace(3,:));
grid on
xlabel('�Ŵ�������');
ylabel('��ı仯��');
title('�������̣�');

[bestZ,num]=min(trace(3,:));
bestX=trace(1,num);
bestY=trace(2,num);
disp('���Ž⣺X=');
disp(num2str(bestX));
disp('Y=');
disp(num2str(bestY));
disp('Z=');
disp(num2str(bestZ));