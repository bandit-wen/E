clc
clear
close
clc
%%  �������忪ʼ     ׼���׶�

%�����㷨�Ĳ���ֵ
lbx=-512;
ubx=512;
NIND=40;%��Ⱥ��С
PRECI=20;%���峤��
MAXGEN=500;%����Ŵ�����
GGAP=0.95;%����
px=0.7;%�������
pm=0.01;%�������
trace=zeros(21,MAXGEN);%���ڴ��Ѱ�Ž��

%����������
FieldD=[rep([PRECI],[1,20]);rep([lbx],[1,20]);rep([ubx],[1,20]);rep([1],[1,20]);rep([0],[1,20]);rep([1],[1,20]);rep([1],[1,20])];
%FieldD�Ĳ����ֱ��Ǹ��峤�ȣ���������½�,����ı��뷽ʽ��
%ʹ�õĿ̶��Լ��Ƿ���������߽�

%NIND����Ⱥ������,PRECI�Ǹ��峤��,Chrom��ÿһ������ǰ50λ��x,��50λ��Y.
[Chrom,Lind,BaseV]=crtbp(NIND,PRECI*20);

%% �Ż��׶�
gen=0;

%����
XY=bs2rv(Chrom,FieldD);

%Ŀ�꺯��ֵ
% ObjV=21.5+X.*sin(4*pi*X)+Y.*sin(20*pi*Y);
ObjV=objfun1(bs2rv(Chrom,FieldD));

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

    %�Ӵ���Ŀ�꺯��ֵ
    %ObjVSel=21.5+X.*sin(4*pi*X)+Y.*sin(20*pi*Y);
    ObjVSel=objfun1(bs2rv(SelCh,FieldD));
    
    %���Ӵ�������븸������
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
    XY=bs2rv(Chrom,FieldD);
    gen=gen+1;
   
    %��ȡ���Ž�Ĵ��ż���ֵ,����yΪ���Ž⣬iΪ���
    [Y,I]=min(ObjV);
    %��¼
    trace(1:20,gen)=XY(I,:);
    trace(21,gen)=Y;
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
[bestZ,num]=min(trace(21,:));
bestX=trace(1,num);
bestY=trace(2,num);
disp('���Ž⣺X=');
disp(num2str(bestX));
disp('Y=');
disp(num2str(bestY));
disp('Z=');
disp(num2str(bestZ));