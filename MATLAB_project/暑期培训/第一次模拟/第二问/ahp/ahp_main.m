%% Ŀ����׼�����жϾ���
p=[4 2 1];
for i=1:3
    for j=1:3
        a(i,j)=p(i)/p(j);
    end
end;

%% ׼����ֵ�Է�������жϾ���
p=[5 4 2 3 2 1];
b=[];
for i=1:6
    for j=1:6
        b(i,j)=p(i)/p(j);
    end
end;

%% ׼�������Է�������жϾ���
p=[1 2 5 5 3];
c=[];
for i=1:5
    for j=1:5
        c(i,j)=p(i)/p(j);
    end
end;

%% ׼����ҵ�ṹ�Է�������жϾ���
p=[1 3 3];
d=[];
for i=1:3
    for j=1:3
        d(i,j)=p(i)/p(j);
    end
end;

%% ������
[max(1),wA]=ahp(a);
[max(2),wb]=ahp(b);
[max(3),wc]=ahp(c);
[max(4),wd]=ahp(d);

RIT=CalculationRI();%����ƽ��һ����ָ��

[RIA,CIA]=sglsortexamine(max(1),a,RIT);
[RIb,CIb]=sglsortexamine(max(2),b,RIT);
[RIc,CIc]=sglsortexamine(max(3),c,RIT);
[RId,CId]=sglsortexamine(max(4),d,RIT);

dw=zeros(14,1);
dw(1:6,1)=wb;
dw(7:11,1)=wc;
dw(12:14,1)=wd;

CIC=[CIb;CIc;CId];
RIC=[RIb;RIc;RId];
tw=tolsortvec(wA,dw,CIC,RIC)';
wA %���׼����Ŀ���Ȩ��
dw %���׼���Է�����Ȩ��
tw  %���������Ȩֵ
res=tw';%���õ�20�׸���Ѷ�����
[score,songnum]=sort(res);
[score,songnum]