function [chrom1 chrom2]=ctzh(a,b,r)
tempa=a(r:end);
tempb=b(r:end);
yuana=a(1:r-1);
yuanb=b(1:r-1);
%% ��ͻ�ٻ�a
while length(unique(a))~=size(a,2)
    indexmjh=[];
    indexjh=[];
    for i=1:length(tempa);
        if ~isempty(find(yuana==tempa(i),1))
            indexmjh(i)=find(yuana==tempa(i));
        end
    end
    indexmjh=nonzeros(indexmjh)';%��ͻ������û��������ε�λ��
    chongtu=yuana(indexmjh);%��ͻ�Ļ���
    for i=1:length(chongtu)
        if ~isempty(find(tempa==chongtu(i),1))
            indexjh(i)=find(tempa==chongtu(i));
        end
    end
    indexjh=nonzeros(indexjh)';%��ͻ�����ڽ�������ε�λ��
    yuana(indexmjh)=tempb(indexjh);
    a=[yuana tempa];
end
%% ��ͻ�ٻ�b
tempa=a(r:end);
tempb=b(r:end);
yuana=a(1:r-1);
yuanb=b(1:r-1);
while length(unique(b))~=size(b,2)
    indexmjh=[];
    indexjh=[];
    for i=1:length(tempb);
        if ~isempty(find(yuanb==tempb(i),1))
            indexmjh(i)=find(yuanb==tempb(i));
        end
    end
    indexmjh=nonzeros(indexmjh)';%��ͻ������û��������ε�λ��
    chongtu=yuanb(indexmjh);%��ͻ�Ļ���
    for i=1:length(chongtu)
        if ~isempty(find(tempb==chongtu(i),1))
            indexjh(i)=find(tempb==chongtu(i));
        end
    end
    indexjh=nonzeros(indexjh)';%��ͻ�����ڽ�������ε�λ��
    yuanb(indexmjh)=tempa(indexjh);
    b=[yuanb tempb];
end
chrom1=a;
chrom2=b;





