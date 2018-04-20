%% ��4.1 ͨ���Ŵ��㷨������¶�Ԫ������
%    max f��x1��x2��=21.5+x1sin��4��x1��+x2sin��20��x2��
%    ����     -3<x1<12.1
%               4.1<x2<5.8
clc
clear
close
clc
%��������
% lbx=-3;
% ubx=12.1;
% lby=4.1;
% uby=5.8;
 lbx=-2;
ubx=2;
lby=-2;
uby=2;
figure(1);
%ezmesh('21.5+x*sin(4*pi*x)+y*sin(20*pi*y)',[lbx,ubx,lby,uby],50);
ezmesh('y*sin(2*pi*x)+x*cos(2*pi*y)',[lbx,ubx,lby,uby],50);

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
% ObjV=21.5+X.*sin(4*pi*X)+Y.*sin(20*pi*Y);
ObjV=Y.*sin(2*pi*X)+X.*cos(2*pi*Y);

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
    ObjVSel=Y.*sin(2*pi*X)+X.*cos(2*pi*Y);
    
    %���Ӵ�������븸������
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
    XY=bs2rv(Chrom,FieldD);
    gen=gen+1;
   
    %��ȡ���Ž�Ĵ��ż���ֵ,����yΪ���Ž⣬iΪ���
    [Y,I]=max(ObjV);
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

% bestZ=trace(3,end);
% bestX=trace(1,end);
% bestY=trace(2,end);
[bestZ,num]=max(trace(3,:));
bestX=trace(1,num);
bestY=trace(2,num);
disp('���Ž⣺X=');
disp(num2str(bestX));
disp('Y=');
disp(num2str(bestY));
disp('Z=');
disp(num2str(bestZ));