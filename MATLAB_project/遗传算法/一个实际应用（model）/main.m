%% �Ŵ��㷨���̽���
% �㷨���̣�
%
%1����ջ������� 
%     close��clear��clc��
%
%2�������Ŵ��㷨������
%     ������Ŀ��NIND
%     ����Ŵ�������MAXGEN
%     ����ά����NVAR�Ż����������м�������
%     �������ȣ�PRECIÿ�������ö೤�Ļ�������
%     ������GGAP
%     ������ʣ�px
%     ������ʣ�pm
%     ���Ѱ�Ž����trace=zeros(MAXGEN,2);
%     trace(1,:)��Ž�ı仯��trace(2,:)��ž�ֵ�ı仯
% 
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
%                   trace(gen,1)=max(ObjV);    
%                   trace(gen,2)=sum(ObjV)/length(ObjV);
%         end
% 
% 6��Ѱ�����Ž�
% for i=1:NIND
%     if ObjV(i)==max(ObjV)
%         value=Phen(i,:);
%         break
%     end
% end
% 7�����
% objvalue=max(ObjV);
% plot(trace(:,1));hold on;
% plot(trace(:,2),'-.');grid;
% legend('��ı仯','��Ⱥ��ֵ�ı仯')

%% �Ŵ��㷨ʵ����ʼ
%% ��ձ���
clear;
clc;

%% �����Ŵ��㷨����
NIND=40;    %������Ŀ��Number of individuals��
MAXGEN=200;    %����Ŵ�����(Maximum number. of generations)
NVAR=9;    %������ά��
PRECI=20;    %�����Ķ�����λ��(Precision of variables)
GGAP=0.9;    %������Generation gap��
px=0.7;     %�������
pm=0.01;    %�������
trace=zeros(MAXGEN,2);    %Ѱ�Ž���ĳ�ʼֵ
 
%% ��������������(Build field descriptor)
vlb=0.5*[110 66 222 118 72 76 30 40 40];
vub=[69 44 155 79 50 42 17 25 22];
ub=[vlb;vub];
FieldD=[rep(PRECI,[1,NVAR]);ub;rep([1;0;1;1],[1,NVAR])];
 
%% ѭ��ǰ׼��
Chrom=crtbp(NIND,NVAR*PRECI);    %������ʼ��Ⱥ��2���ƣ�
Phen=bs2rv(Chrom,FieldD);    %��ʼ��Ⱥ��10���ƻ�
gen=0;                      %��������
ObjV=objfunction(Phen);%�����ʼ��Ⱥ�����Ŀ�꺯��ֵ

%% ��ʼѭ��
while gen<MAXGEN
    
    f=ranking(-ObjV);    %������Ӧ��ֵ��Assign fitness values
    FitnV=fit(f,Phen);
    SelCh=select('sus',Chrom,FitnV,GGAP);    %ѡ��
    SelCh=recombin('xovsp',SelCh,px);    %����
    SelCh=mut(SelCh);    %����  
    Phen=bs2rv(SelCh,FieldD);
    ObjVSel=objfunction(Phen);
    %�ز����Ӵ�������Ⱥ
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);    
    Phen=bs2rv(Chrom,FieldD);
    gen=gen+1;    %������������
    trace(gen,1)=max(ObjV);    %�Ŵ��㷨���ܸ���
    trace(gen,2)=sum(ObjV)/length(ObjV);
end

%% zhoa
for i=1:NIND
    if ObjV(i)==max(ObjV)
        value=Phen(i,:);
        break
    end
end

%%
objvalue=max(ObjV);
plot(trace(:,1));hold on;
plot(trace(:,2),'-.');grid;
legend('��ı仯','��Ⱥ��ֵ�ı仯')


