%��¼�к��е���Ա����
name={'��漾�' '����' '��˧' '���' '���' '��ܿ��' '����ܿ' '���信' '����' '���մ�' '������' '�����' '��ݼܿ' '���ɺ�' '��ν' '½ӯ' '���' '�Ϸ�' '������' '����' '����' '���' '����ع' '������' 'ͯԥ' 'Ϳ��֪' '�����' '��֥' '����' '������' 'л����' '����' '�ž�' '����ܿ' '��ͥ��' '��ٻ'};
%��������
[num,txt,raw]=xlsread('2017��ʮ�컪�е�����ѧ��ģ������_������B��_����_ͨ����¼');
%ѭ������
pres=zeros(36,2);
for i=1:36
    res1=strcmp(txt(:,3), name(i));
    out=find(res1==1);
    outnum=length(out);%����ĵ绰��Ŀ
    res2=strcmp(txt(:,5), name(i));
    in=find(res2==1);
    innum=length(in);%����ĵ绰��Ŀ
    pres(i,1)=outnum;
    pres(i,2)=innum;
end
%% Ŀ����׼�����жϾ���
a=[1 9/7 9/5;7/9 1 7/5;5/9 5/7 1];

%% ׼����绰Ƶ�ʶԷ�������жϾ���
p=pres(:,1);
p=p';
b=[];
for i=1:36
    for j=1:36
        b(i,j)=p(i)/p(j);
    end
end;

%% ׼����绰/��绰+�ӵ绰�Է�������жϾ���
p1=pres(:,1);
p1=p1';
p2=pres(:,2);
p2=p2';
p=p1./(p1+p2);
c=[];
for i=1:36
    for j=1:36
        c(i,j)=p(i)/p(j);
    end
end;

%% ׼���绰ʱ���Է�������жϾ���
p=[7,9,3,3,1,1,1,3,3,1,1,1,1,3,1,1,1,1,1,7,1,1,1,3,1,1,1,1,1,1,1,3,5,7,1,3];
d=[];
for i=1:36
    for j=1:36
        d(i,j)=p(i)/p(j);
    end
end;

%% ������
[max(1),wA]=ahp(a);
[max(2),wb]=ahp(b);
[max(3),wc]=ahp(c);
[max(4),wd]=ahp(d);

RIT=CalculationRI(36);%����ƽ��һ����ָ��

[RIA,CIA]=sglsortexamine(max(1),a,RIT);
[RIb,CIb]=sglsortexamine(max(2),b,RIT);
[RIc,CIc]=sglsortexamine(max(3),c,RIT);
[RId,CId]=sglsortexamine(max(4),d,RIT);

dw=zeros(36,3);
dw(1:36,1)=wb;
dw(1:36,2)=wc;
dw(1:36,3)=wd;

CIC=[CIb;CIc;CId];
RIC=[RIb;RIc;RId];
tw=tolsortvec(wA,dw,CIC,RIC)';
wA %���׼����Ŀ���Ȩ��
dw %���׼���Է�����Ȩ��
tw  %���������Ȩֵ
res=tw';%���õ�36���˵��Ѷ�����
[pro,pernum]=sort(res);
res=[pro,pernum];



