%% �Ŵ��㷨���̽���
% �㷨���̣�
%
%1����ջ������� 
%     close��clear��clc��
%
clear;
clc;
%2�������Ŵ��㷨������
%     ������Ŀ��NIND
%     ����Ŵ�������MAXGEN
%     ����ά����NVAR�Ż����������м�������
%     �������ȣ�PRECIÿ�������ö೤�Ļ�������
%     ������GGAP
%     ������ʣ�px
%     ������ʣ�pm
%     ���Ѱ�Ž����trace=zeros(MAXGEN,NVAR+1);
%     trace(:,1:NVAR)���ÿһ�����Ա�����trace(:��NVAR+1)���ÿһ���Ľ�
% 
lbx1=0;ubx1=2.8274; 
lbx2=0;ubx2=2.8274;
lbx3=0;ubx3=2.8274;
lbx4=0;ubx4=2.8274;
lbx5=0;ubx5=2.8274;
NIND=100;        %������Ŀ
NVAR=5;
MAXGEN=30;      %����Ŵ�����
PRECI=20;       %�����Ķ�����λ��
GGAP=0.95;      %����
px=0.6;         %�������
pm=0.1;        %�������
trace=zeros(MAXGEN,NVAR+1);                        %Ѱ�Ž���ĳ�ʼֵ

% 3����������������
%     FieldD=[   len:��ʼ��Ⱥ��ÿ���Ӵ��ĳ���
%                     lb:ÿ���������½�
%                     ub:ÿ���������Ͻ�
%                     code:���뷽ʽ��1Ϊ�����Ʊ��룬0Ϊ���ױ���
%                     scale:ÿ���Ӵ��Ŀ̶ȣ�1�Ƕ����̶ȣ�0�������̶�
%                     lbin:�½��Ƿ�����߽磬1������0������
%                     ubin:�Ͻ��Ƿ�����߽磬1������0������
%                 ];
%     MatOut = rep(MatIn, REPN):����rep��ɾ���MatIn�ĸ��ƣ�
%     REPNָ�����ƴ���,���ظ��ƺ�ľ���MatOut��
%     REPN����ÿ�������ƵĴ�����REPN=[1,2];
%     REPN(1)��ʾ�����ƴ�����REPN(2)��ʾˮƽ�����ƴ���
% 
FieldD=[PRECI PRECI PRECI PRECI PRECI;lbx1 lbx2 lbx3 lbx4 lbx5;ubx1 ubx2 ubx3 ubx4 ubx5;1 1 1 1 1;0 0 0 0 0;1 1 1 1 1;1 1 1 1 1];                      %����������  
% 4��ѭ��ǰ׼����
%     �ٴ�����Ⱥ��[Chrom,Lind,BaseV]=crtbp(Nind,Lind,Base)
%        ����һ����СΪNind,���峤��ΪLind,��λ���Ʒֱ���Base����Ⱥ
%        ����ֵChrom����Ⱥ��Lind�Ǹ��峤�ȣ�BaseV�Ǹ�λ������
%     �ڳ�ʼ��Ⱥʮ���ƻ���Phen=bs2rv(Chrom,FieldD)
%        ��������ת��Ϊʮ���ơ�
%        Chrom����Ⱥ��FieldD���������(����������)
%        Phen��һ����������ÿ�������Ƕ�Ӧ��ʮ������
%     �۳�ʼ������������gen=0
%     �ܼ����ʼ��Ⱥ�����Ŀ�꺯��ֵ��ObjV=objfunction(Phen);
%         �˴����Ǽ���������Ҫ�Ż��ĺ������ڵ�ǰ�ĺ���ֵ�ĵط�
% 
Chrom=crtbp(NIND,PRECI*NVAR); 
gen=0;                                  %��������
Phen=bs2rv(Chrom,FieldD);                 %�����ʼ��Ⱥ��ʮ����ת��
X1=Phen(:,1);X2=Phen(:,2);X3=Phen(:,3);X4=Phen(:,4);X5=Phen(:,5);
ObjV=-5*sin(X1).*sin(X2).*sin(X3).*sin(X4).*sin(X5)-sin(5*X1).*sin(5*X2).*sin(5*X3).*sin(5*X4).*sin(5*X5)+8;        %����Ŀ�꺯��ֵ
% 5��ѭ��
%       while gen<MAXGEN
%                ��FitnV=ranking(ObjV��-ObjV����1./ObjV);
%                   ranking������С�����˳�����ɸߵ��͵���Ӧ��ֵ
%                   FitnV����Ӧ��ֵ
%                   ��ˣ�Ҫ�����ֵӦ��-ObjV����Сֵ��ObjV
%                ��SelCh=select(SEL_F,Chrom,FitnV,GGAP);
%                   SEL_F��һ��ѡ����������rws(���̶�)��sus(�����������)
%                   Chrom�Ǿ���Ⱥ
%                ��SelCh=recombin(REC_F,Chrom��px);
%                   REC_F��һ�����麯��������recdis(��ɢ����)��xovsp(���㽻��)
%                ��SelCh=mut(OldChrom,pm,BaseV)
%                   BaseV�Ǳ���Ļ����ַ������뷽ʽ
%                �ݽ���������Ⱥת��Ϊʮ���ƣ������¼���Ŀ�꺯��ֵObjVSel
%                ��[SelCh, ObjVCh] = reins(Chrom, SelCh, SUBPOP, InsOpt, ObjVCh, ObjVSel)
%                   Chrom�Ǹ�����Ⱥ��SelCh���Ӵ���Ⱥ��
%                   SUBPOPָ��ǰ����������Ⱥ�ĸ���
%                   InsOpt(1)ָ�����Ӵ����游����ѡ�񷽷���0Ϊ����ѡ��1Ϊ������Ӧ�ȵ�ѡ��Ĭ��Ϊ0
%                   InsOpt(2)ָ����[0 1]��ÿ������Ⱥ���ز�����Ӵ���������������Ⱥ���и���ı��ʣ�Ĭ��Ϊ1
%                   ObjVch����Chorm�и����Ŀ��ֵ���Ի�����Ӧ�ȵ��ز����Ǳ����
%                   ObjVSel����Selch�и����Ŀ��ֵ�����Ӵ����������ز�����Ⱥ���Ӵ������Ǳ����

%                �߽����²�������Ⱥת��Ϊʮ����
%                �����������һ��gen=gen+1
%                ���Ŵ��㷨���ܸ���
%                   trace(gen,NVAR+1)=max(ObjV);  
%                   trace(gen,1:NVAR)=Phen';
%         end
% 
while gen<MAXGEN
   FitnV=ranking(1./ObjV);                              %������Ӧ��ֵ
   SelCh=select('sus',Chrom,FitnV,GGAP);              %ѡ��
   SelCh=recombin('xovsp',SelCh,px);                  %����
   SelCh=mut(SelCh,pm);                               %����
   Phen=bs2rv(SelCh,FieldD);               %�Ӵ������ʮ����ת��
   X1=Phen(:,1);X2=Phen(:,2);X3=Phen(:,3);X4=Phen(:,4);X5=Phen(:,5);
   ObjVSel= -5*sin(X1).*sin(X2).*sin(X3).*sin(X4).*sin(X5)-sin(5*X1).*sin(5*X2).*sin(5*X3).*sin(5*X4).*sin(5*X5)+8;             %�����Ӵ���Ŀ�꺯��ֵ
   [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %�ز����Ӵ����������õ�����Ⱥ
   Phen=bs2rv(Chrom,FieldD);
   X1=Phen(:,1);X2=Phen(:,2);X3=Phen(:,3);X4=Phen(:,4);X5=Phen(:,5);
   gen=gen+1                                      %����������
   if mod(gen,10)==0
       for i=1:NIND
           x=Phen(i,:);         %X_init����װÿ����ʼ���Ա���ֵ���Ǹ�������
           %X_min=zeros(5,NIND);     %X_min������¼ÿ�������Сֵ��Ӧ���Ա�����ÿ�д���һ��������Ա���ֵ��
           %Z_min=zeros(NIND,1);     %Z_min������¼ÿ���������Сֵ
           [X_min(:,i),Z_min(i)]=fmincon(inline('8-5*sin(x(1))*sin(x(2))*sin(x(3))*sin(x(4))*sin(x(5))-sin(5*x(1))*sin(5*x(2))*sin(5*x(3))*sin(5*x(4))*sin(5*x(5))'),x,[],[],[],[],[0 0 0 0 0],[2.8274 2.8274 2.8274 2.8274 2.8274]);
       end
       [A,I]=min(Z_min);trace(gen,1)=A;trace(gen,2)=X_min(1,I);trace(gen,3)=X_min(2,I);trace(gen,4)=X_min(3,I);trace(gen,5)=X_min(4,I);trace(gen,6)=X_min(5,I);
   else
        [A,I]=min(ObjV);trace(gen,1)=A;trace(gen,2)=X1(I);trace(gen,3)=X2(I);trace(gen,4)=X3(I);trace(gen,5)=X4(I);trace(gen,6)=X5(I);
   end
end
% 6��Ѱ�����Ž�
%      index=find(ObjV==max(ObjV));
%      soluiton(1,1:NVAR)=trace(index,1:NVAR);
% 
% 7�����
figure(1);
plot(1:MAXGEN,trace(:,1));
grid on
xlabel('�Ŵ�����')
ylabel('��ı仯')
title('��������')
index=find(trace(:,1)==min(trace(:,1)));
trace(index,:)