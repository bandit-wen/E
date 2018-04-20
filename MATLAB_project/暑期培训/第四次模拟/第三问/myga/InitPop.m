%% ��ʼ����Ⱥ
%���룺
% NIND����Ⱥ��С
% N��   ����Ⱦɫ�峤�ȣ�����Ϊ����ĸ�����  
%�����
%��ʼ��Ⱥ
function Chrom=InitPop(NIND,N)
Chrom=zeros(NIND,N);%���ڴ洢��Ⱥ
for i=1:NIND
    A=rand(1,N); 
    S=sum(A);
    B=A*100/S;
    for j=1:9
        Chrom(i,j)=floor(B(j));%������ɳ�ʼ��Ⱥ 
    end
    Chrom(i,10)=100-sum(Chrom(i,:));
end