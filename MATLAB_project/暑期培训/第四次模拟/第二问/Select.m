%% ѡ�����
%����
%Chrom ��Ⱥ
%FitnV ��Ӧ��ֵ
%GGAP��ѡ�����
%���
%SelCh  ��ѡ��ĸ���
function SelCh=Select(Chrom,FitnV,GGAP)
NIND=size(Chrom,1);
NSel=floor(NIND*GGAP+.5);
ChrIx=Sus(FitnV,NSel);
SelCh=Chrom(ChrIx,:);