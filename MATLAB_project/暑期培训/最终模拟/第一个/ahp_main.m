%% ����
% Ŀ����׼�����жϾ���
% alpha2 =    0.6443
% alpha3 =    0.2225
% alpha5 =    0.1332

clear;close;clc;
a=[1 5 3 7;1/5 1 1/3 3;1/3 3 1 5;1/7 1/3 1/5 1];
%׼���ͨ·ͨ���Է�������жϾ���
%          ����    ����    ����
% ����    1                         
% ����               1                     
% ����                            1     
b=[1 4 5;1/4 1 1;1/5 1 1];
%׼����������Է�������жϾ���
c=[1 4 7;1/4 1 3;1/7 1/3 1];
%׼�����Դ����Է�������жϾ���
d=[1 5 8;1/5 1 2;1/8 1/2 1];
%׼�����ó���ζԷ�������жϾ���
e=[1 4 7;1/4 1 3;1/7 1/3 1];
[max(1),wA]=ahp(a);
[max(2),wb]=ahp(b);
[max(3),wc]=ahp(c);
[max(4),wd]=ahp(d);
[max(5),we]=ahp(e);
RIT=[0 0 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56...
    1.58 1.59 1.605 1.6158 1.6264 1.6327 1.6403 1.6481 1.6531...
    1.6591 1.6622 1.6686 1.6705 1.6755 1.6779 1.6816 1.6840];
[RIA,CIA]=sglsortexamine(max(1),a,RIT);
[RIb,CIb]=sglsortexamine(max(2),b,RIT);
[RIc,CIc]=sglsortexamine(max(3),c,RIT);
[RId,CId]=sglsortexamine(max(4),d,RIT);
[RIe,CIe]=sglsortexamine(max(5),e,RIT);
dw=zeros(3,4);
dw(1:3,1)=wb;
dw(1:3,2)=wc;
dw(1:3,3)=wd;
dw(1:3,4)=we;
CIC=[CIb;CIc;CId;CIe];
RIC=[RIb;RIc;RId;RIe];
tw=tolsortvec(wA,dw,CIC,RIC)';
wA; %���׼����Ŀ���Ȩ��
dw; %���׼���Է�����Ȩ��
tw;  %���������Ȩֵ
res=tw';%���õ�4�ַ������Ѷ�����
[diffcult,songnum]=sort(res);
[diffcult,songnum]
load A.mat
%res(1)����,res(2)����,res(3)����,A1���ڷ���,A2���ڻ���,
%A3���û���,A4���û���,A5���λ���,A6���η���
njyg=res(3)*A2+res(2)*A3+res(1)*A5;
[n1,indjp]=sort(jyg);
[n2,indjn]=sort(njyg);
% nfxg=res(3)*A1+res(2)*A4+res(1)*A6;
% [n3,indfp]=sort(fxg);
% [n4,indfn]=sort(nfxg);
fprintf('%s\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n','�������ҵĻ������ֱַ��ǣ�',jyg(1),jyg(2),jyg(3),jyg(4),jyg(5),jyg(6),jyg(7),jyg(8),jyg(9),jyg(10),jyg(11),jyg(12),jyg(13),jyg(14),jyg(15),jyg(16),jyg(17),jyg(18),jyg(19),jyg(20),jyg(21),jyg(22),jyg(23),jyg(24),jyg(25),jyg(26),jyg(27),jyg(28),jyg(29));
[indjp indjn];
last1=[];
for i=1:29
    index1=find(indjp==i);
    index2=find(indjn==i);
    last1(i,:)=[index1 index2];
end
%% ����
% alpha1 =    0.4999
% alpha4 =    0.4185
% alpha6 =    0.0817
a=[1 7 5 3;1/7 1 1/3 1/2;1/5 3 1 1;1/3 3 1 1];
%׼���ͨ·ͨ���Է�������жϾ���
%          ����    ����    ����
% ����    1                         
% ����               1                     
% ����                            1     
b=[1 1 7;1 1 9;1/7 1/9 1];
%׼����������Է�������жϾ���
c=[1 1 3;1 1 7;1/3 1/7 1];
%׼�����Դ����Է�������жϾ���
d=[1 1 5;1 1 9;1/5 1/9 1];
%׼�����ó���ζԷ�������жϾ���
e=[1 1 2;1 1 5;1/2 1/5 1];
[max(1),wA]=ahp(a);
[max(2),wb]=ahp(b);
[max(3),wc]=ahp(c);
[max(4),wd]=ahp(d);
[max(5),we]=ahp(e);
RIT=[0 0 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56...
    1.58 1.59 1.605 1.6158 1.6264 1.6327 1.6403 1.6481 1.6531...
    1.6591 1.6622 1.6686 1.6705 1.6755 1.6779 1.6816 1.6840];
[RIA,CIA]=sglsortexamine(max(1),a,RIT);
[RIb,CIb]=sglsortexamine(max(2),b,RIT);
[RIc,CIc]=sglsortexamine(max(3),c,RIT);
[RId,CId]=sglsortexamine(max(4),d,RIT);
[RIe,CIe]=sglsortexamine(max(5),e,RIT);
dw=zeros(3,4);
dw(1:3,1)=wb;
dw(1:3,2)=wc;
dw(1:3,3)=wd;
dw(1:3,4)=we;
CIC=[CIb;CIc;CId;CIe];
RIC=[RIb;RIc;RId;RIe];
tw=tolsortvec(wA,dw,CIC,RIC)';
wA; %���׼����Ŀ���Ȩ��
dw; %���׼���Է�����Ȩ��
tw;  %���������Ȩֵ
res=tw';%���õ�4�ַ������Ѷ�����
[diffcult,songnum]=sort(res);
[diffcult,songnum]
load A.mat
%res(1)����,res(2)����,res(3)����,A1���ڷ���,A2���ڻ���,
%A3���û���,A4���û���,A5���λ���,A6���η���
% njyg=res(3)*A2+res(2)*A3+res(1)*A5;
% [n1,indjp]=sort(jyg);
% [n2,indjn]=sort(njyg);
nfxg=res(3)*A1+res(2)*A4+res(1)*A6;
[n3,indfp]=sort(fxg);
[n4,indfn]=sort(nfxg);
fprintf('%s\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n%f\n','�������ҵķ������ֱַ��ǣ�',fxg(1),fxg(2),fxg(3),fxg(4),fxg(5),fxg(6),fxg(7),fxg(8),fxg(9),fxg(10),fxg(11),fxg(12),fxg(13),fxg(14),fxg(15),fxg(16),fxg(17),fxg(18),fxg(19),fxg(20),fxg(21),fxg(22),fxg(23),fxg(24),fxg(25),fxg(26),fxg(27),fxg(28),fxg(29));
[indfp indfn];
last2=[];
for i=1:29
    index1=find(indfp==i);
    index2=find(indfn==i);
    last2(i,:)=[index1 index2];
end




