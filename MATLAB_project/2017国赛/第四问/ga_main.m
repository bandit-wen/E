%% ga�Ż�
clc
clear
close
clc
load ga.mat
%��������
lbx=0;
ubx=2;

%%  �������忪ʼ     ׼���׶�
%�����㷨�Ĳ���ֵ
NIND=40;%��Ⱥ��С
PRECI=50;%���峤��
MAXGEN=1000;%����Ŵ�����
GGAP=0.95;%����
px=0.7;%�������
pm=0.01;%�������
trace=zeros(3,MAXGEN);%���ڴ��Ѱ�Ž��
res=trace;%�������ֵ
p=zeros(92,MAXGEN);%������Ž��Ӧ�ĸ���

%����������
FieldD=[rep(PRECI,[1 92]);rep(lbx,[1 92]);rep(ubx,[1 92]);ones(1,92);zeros(1,92);ones(1,92);ones(1,92)];
%FieldD�Ĳ����ֱ��Ǹ��峤�ȣ���������½�,����ı��뷽ʽ��
%ʹ�õĿ̶��Լ��Ƿ���������߽�

%NIND����Ⱥ������,PRECI�Ǹ��峤��,Chrom��ÿһ������ǰ50λ��x,��50λ��Y.
[Chrom,Lind,BaseV]=crtbp(NIND,PRECI*92);

%% �Ż��׶�
gen=0;

%����
XY=bs2rv(Chrom,FieldD);
XY=dealXY(XY);
a=[];
for i=1:23
    a=[a XY(:,i)];
end
b=[];
for i=1:23
    b=[b XY(:,i)];
end
c=[];
for i=1:23
    c=[c XY(:,i)];
end
d=[];
for i=1:23
    d=[d XY(:,i)];
end

%Ŀ�꺯��ֵ
[ObjV,P,D]=cal(NIND,pxy,xy1,pjs,js1,prs,rs1,prw,rw1,a,b,c,d,xyqq,jsqq,rsqq,rwqq,mon);

while gen<MAXGEN
    gen
    %������Ӧ��
    FitnV=ranking(1./ObjV);%��ʮ��������������Ӧ������
    %ѡ��
    SelCh=select('sus',Chrom,FitnV,GGAP);
    %����
    SelCh=recombin('xovsp',SelCh,px);
    %����
    SelCh=mut(SelCh,pm);
    %�Ӵ���Ŀ�꺯��ֵ
    XY=bs2rv(SelCh,FieldD);
    XY=dealXY(XY);
    a=[];
    for i=1:23
        a=[a XY(:,i)];
    end
    b=[];
    for i=1:23
        b=[b XY(:,i)];
    end
    c=[];
    for i=1:23
        c=[c XY(:,i)];
    end
    d=[];
    for i=1:23
        d=[d XY(:,i)];
    end
    
    %�Ӵ���Ŀ�꺯��ֵ
    [ObjVSel,P,D]=cal(size(XY,1),pxy,xy1,pjs,js1,prs,rs1,prw,rw1,a,b,c,d,xyqq,jsqq,rsqq,rwqq,mon);
    
    %���Ӵ�������븸������
    [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
    XY=bs2rv(Chrom,FieldD);
    XY=dealXY(XY);
    gen=gen+1;
    
    %��ȡ���Ž�Ĵ��ż���ֵ,����yΪ���Ž⣬iΪ���
    [Y,I]=max(ObjV);
    [hh,ii]=max(ObjVSel);
    %��¼
    trace(1,gen)=Y;
    trace(2,gen)=P(ii);
    trace(3,gen)=D(ii);
    res(1,gen)=max(trace(1,:));
    p(:,gen)=XY(I,:);
end
figure
plot(1:MAXGEN,trace(1,:));
grid on
xlabel('�Ŵ�������');
ylabel('��ı仯��');
title('�������̣�');
figure
plot(1:MAXGEN,res(1,:));
grid on
xlabel('�Ŵ�������');
ylabel('���Ž�ı仯��');
title('�������̣�');
[m,index]=max(trace(1,:));
fprintf('%s%f\n%s%f\n','���Ž�Ϊ��',m,'��Ӧ��ͨ����Ϊ',trace(2,index));
disp(p(:,index));