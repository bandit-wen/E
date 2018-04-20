function lof=lof(x,fhn,k)
%�������ľ���
x=x/10000;
distance=zeros(length(fhn),length(fhn));
for i=1:length(fhn)
    for j=1:length(fhn)
        distance(i,j)=sqrt((x(i)-x(j))^2+(fhn(i)-fhn(j))^2);
    end
end
%���k����
distancek=zeros(length(fhn),1);
for i=1:length(fhn)
    temp=sort(distance(i,:));
    distancek(i)=temp(k+1);
end
%��ɴ����
reachdistance=zeros(length(fhn),length(fhn));
for i=1:length(fhn)
    for j=1:length(fhn)
        if distance(i,j)<=distancek(i)
            reachdistance(i,j)=distancek(i);
        else
            reachdistance(i,j)=distance(i,j);
        end
    end
end
%��ֲ��ɴ��ܶ�
lrdk=zeros(length(fhn),1);
for i=1:length(fhn)
    index=find(distance(i,:)<distancek(i));
    s=sum(reachdistance(index,i));
    s=s/k;
    lrdk(i)=1/s;
end
%��ֲ���Ⱥ����
lof=zeros(length(fhn),1);
for i=1:length(fhn)
    index=find(distance(i,:)<distancek(i));
    s=sum(lrdk(index));
    s=s/lrdk(i);
    lof(i)=s/k;
end