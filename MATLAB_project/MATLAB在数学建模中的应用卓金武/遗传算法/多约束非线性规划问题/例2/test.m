%% �Ŵ��㷨+�����Թ滮����ֵ
%Ŀ�꺯��Ϊminf(x)=exp(x1)*(4x1^2+2x2^2+4x1x2+2x2+1)
%Լ������Ϊ:1.5+x1x2-x1-x2<=0
%                   -x1x2<=10
clc
clear all
close all

%% �����Ŵ��㷨����
NIND=100;        %������Ŀ
MAXGEN=30;      %����Ŵ�����
PRECI=20;       %�����Ķ�����λ��
GGAP=0.95;      %����
px=0.6;         %�������
pm=0.1;        %�������
trace=zeros(3,MAXGEN);                        %Ѱ�Ž���ĳ�ʼֵ

FieldD=[PRECI PRECI;0 0;10 10;1 1;0 0;1 1;1 1]; %����������
Chrom=crtbp(NIND,PRECI*2);                      %��ʼ��Ⱥ
%% �Ż�
gen=0;                                  %��������
x=bs2rv(Chrom,FieldD);                 %�����ʼ��Ⱥ��ʮ����ת��
x1=x(:,1);x2=x(:,2);
ObjV=exp(x1).*(4*x1.^2+2*x2.^2+4*x1.*x2+2*x2+1);        %����Ŀ�꺯��ֵ
while gen<MAXGEN
   FitnV=ranking(ObjV);                              %������Ӧ��ֵ
   SelCh=select('sus',Chrom,FitnV,GGAP);              %ѡ��
   SelCh=recombin('xovsp',SelCh,px);                  %����
   SelCh=mut(SelCh,pm);                               %����
   x=bs2rv(SelCh,FieldD);               %�Ӵ������ʮ����ת��
   x1=x(:,1);x2=x(:,2);
   ObjVSel= exp(x1).*(4*x1.^2+2*x2.^2+4*x1.*x2+2*x2+1);%�����Ӵ���Ŀ�꺯��ֵ
   [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %�ز����Ӵ����������õ�����Ⱥ
   x=bs2rv(Chrom,FieldD);
   x1=x(:,1);x2=x(:,2);
   gen=gen+1                                      %����������
   if mod(gen,10)==0
       for i=1:NIND
           X=x(i,:);         %X_init����װÿ����ʼ���Ա���ֵ���Ǹ�������
           %X_min=zeros(5,NIND);     %X_min������¼ÿ�������Сֵ��Ӧ���Ա�����ÿ�д���һ��������Ա���ֵ��
           %Z_min=zeros(NIND,1);     %Z_min������¼ÿ���������Сֵ
           [X_min(:,i),Z_min(i)]=fmincon('fun1',X,[],[],[],[],[-10 -10],[],'test_nonLcon');
       end
       [A,I]=min(Z_min);
       trace(1,gen)=A;
       trace(2,gen)=X_min(1,I);
       trace(3,gen)=X_min(2,I);
   else
        [A,I]=min(ObjV);
        trace(1,gen)=A;
        trace(2,gen)=x1(I);
        trace(3,gen)=x2(I);
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
fprintf(['���Ž�:\nX1=',num2str(bestX1),'\nX2=',num2str(bestX2),'\nZ=',num2str(bestZ),'\n'])