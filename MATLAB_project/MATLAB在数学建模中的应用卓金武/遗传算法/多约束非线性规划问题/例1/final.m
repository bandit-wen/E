%% �Ŵ��㷨+�����Թ滮����ֵ
%Ŀ�꺯��Ϊ8-5sin(x1)sin(x2)sin(x3)sin(x4)sin(x5)-sin(5x1)sin(5x2)sin(5x3)sin(5x4)sin(5x5)
clc
clear all
close all

%�����Ա����ķ�Χ
lbx1=0;ubx1=2.8274; 
lbx2=0;ubx2=2.8274;
lbx3=0;ubx3=2.8274;
lbx4=0;ubx4=2.8274;
lbx5=0;ubx5=2.8274;

%% �����Ŵ��㷨����
NIND=100;        %������Ŀ
MAXGEN=30;      %����Ŵ�����
PRECI=20;       %�����Ķ�����λ��
GGAP=0.95;      %����
px=0.6;         %�������
pm=0.1;        %�������
trace=zeros(6,MAXGEN);                        %Ѱ�Ž���ĳ�ʼֵ

FieldD=[PRECI PRECI PRECI PRECI PRECI;lbx1 lbx2 lbx3 lbx4 lbx5;ubx1 ubx2 ubx3 ubx4 ubx5;1 1 1 1 1;0 0 0 0 0;1 1 1 1 1;1 1 1 1 1];                      %����������
Chrom=crtbp(NIND,PRECI*5);                      %��ʼ��Ⱥ
%% �Ż�
gen=0;                                  %��������
X=bs2rv(Chrom,FieldD);                 %�����ʼ��Ⱥ��ʮ����ת��
X1=X(:,1);X2=X(:,2);X3=X(:,3);X4=X(:,4);X5=X(:,5);
ObjV=-5*sin(X1).*sin(X2).*sin(X3).*sin(X4).*sin(X5)-sin(5*X1).*sin(5*X2).*sin(5*X3).*sin(5*X4).*sin(5*X5)+8;        %����Ŀ�꺯��ֵ
while gen<MAXGEN
   FitnV=ranking(ObjV);                              %������Ӧ��ֵ
   SelCh=select('sus',Chrom,FitnV,GGAP);              %ѡ��
   SelCh=recombin('xovsp',SelCh,px);                  %����
   SelCh=mut(SelCh,pm);                               %����
   X=bs2rv(SelCh,FieldD);               %�Ӵ������ʮ����ת��
   X1=X(:,1);X2=X(:,2);X3=X(:,3);X4=X(:,4);X5=X(:,5);
   ObjVSel= -5*sin(X1).*sin(X2).*sin(X3).*sin(X4).*sin(X5)-sin(5*X1).*sin(5*X2).*sin(5*X3).*sin(5*X4).*sin(5*X5)+8;             %�����Ӵ���Ŀ�꺯��ֵ
   [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %�ز����Ӵ����������õ�����Ⱥ
   X=bs2rv(Chrom,FieldD);
   X1=X(:,1);X2=X(:,2);X3=X(:,3);X4=X(:,4);X5=X(:,5);
   gen=gen+1                                      %����������
   if mod(gen,10)==0
       for i=1:NIND
           x=X(i,:);         %X_init����װÿ����ʼ���Ա���ֵ���Ǹ�������
           %X_min=zeros(5,NIND);     %X_min������¼ÿ�������Сֵ��Ӧ���Ա�����ÿ�д���һ��������Ա���ֵ��
           %Z_min=zeros(NIND,1);     %Z_min������¼ÿ���������Сֵ
           [X_min(:,i),Z_min(i)]=fmincon(inline('8-5*sin(x(1))*sin(x(2))*sin(x(3))*sin(x(4))*sin(x(5))-sin(5*x(1))*sin(5*x(2))*sin(5*x(3))*sin(5*x(4))*sin(5*x(5))'),x,[],[],[],[],[0 0 0 0 0],[2.8274 2.8274 2.8274 2.8274 2.8274]);
       end
       [A,I]=min(Z_min);trace(1,gen)=A;trace(2,gen)=X_min(1,I);trace(3,gen)=X_min(2,I);trace(4,gen)=X_min(3,I);trace(5,gen)=X_min(4,I);trace(6,gen)=X_min(5,I);
   else
        [A,I]=min(ObjV);trace(1,gen)=A;trace(2,gen)=X1(I);trace(3,gen)=X2(I);trace(4,gen)=X3(I);trace(5,gen)=X4(I);trace(6,gen)=X5(I);
   end
end

%% ������ͼ
figure(1);
plot(1:MAXGEN,trace(1,:));
grid on
xlabel('�Ŵ�����')
ylabel('��ı仯')
title('��������')
bestZ=trace(1,end);
bestX1=trace(2,end);
bestX2=trace(3,end);
bestX3=trace(4,end);
bestX4=trace(5,end);
bestX5=trace(6,end);
fprintf(['���Ž�:\nX1=',num2str(bestX1),'\nX2=',num2str(bestX2),'\nX3=',num2str(bestX3),'\nX4=',num2str(bestX4),'\nX5=',num2str(bestX5),'\nZ=',num2str(bestZ),'\n'])