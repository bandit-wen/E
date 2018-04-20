close;
clear 
clc
NIND=100;       %��Ⱥ��С
MAXGEN=1500;
Pc=0.9;         %�������
Pm=0.05;        %�������
GGAP=0.95;      %����(Generation gap)
N=10;    %(34*34)
%% ��ʼ����Ⱥ
Chrom=InitPop(NIND,N);
%% ��������
disp('��ʼ��Ⱥ�е�һ�������:')
res1=val(Chrom(1,:));
disp(res1);
disp('��Ŀ�꺯��ֵ��');
disp(val(Chrom(1,:)));
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
%% �Ż�
gen=0;
maxval=zeros(1,MAXGEN+1);
maxx=zeros(MAXGEN,10);
ObjV=val(Chrom);  
[maxObjV,maxInd]=max(ObjV);
maxval(1)=maxObjV;
maxx(1,:)=Chrom(maxInd,:);
preObjV=max(maxval);
while gen<MAXGEN
    disp(gen);
    %% ������Ӧ��
    ObjV=val(Chrom);  %����·�߳���
    line([gen-1,gen],[preObjV,max(maxval)]);
    pause(0.0001)
    preObjV=max(maxval);
    FitnV=Fitness(ObjV);
    %% ѡ��
    SelCh=Select(Chrom,FitnV,GGAP);
    %% �������
    SelCh=Recombin(SelCh,Pc);
    %% �ز����Ӵ�������Ⱥ
    Chrom=Reins(Chrom,SelCh,ObjV);
    %% ��¼���Ž�
    ObjV=val(Chrom);  
    [maxObjV,maxInd]=max(ObjV);
    maxval(gen+2)=maxObjV;
    maxx(gen+2,:)=Chrom(maxInd,:);
    %% ���µ�������
    gen=gen+1 ;
end
hold off;
%% ������Ž�
disp('���Ž�:')
[resval,resx]=max(maxval);
disp(['Ŀ�꺯��ֵ��',num2str(resval)]);
disp(['������:',num2str(maxx(resx,:))]);
disp('-------------------------------------------------------------')
