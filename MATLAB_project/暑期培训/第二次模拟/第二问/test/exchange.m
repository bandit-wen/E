load matlab.mat
%ȡǰ���122����Ϊ��ʼ��Ⱥ��ÿ16��һ������
pop=zeros(7,16);
pop(1,:)=array(1:16);
pop(2,:)=array(17:32);
pop(3,:)=array(33:48);
pop(4,:)=array(49:64);
pop(5,:)=array(65:80);
pop(6,:)=array(81:96);
pop(7,:)=array(97:112);
maxgen=10;
chrom=zeros(maxgen,112);
for i=1:maxgen
    disp(i);
    %������
    pop=interthree(pop);
    disp('�������');
    %����(���ó�ͻ�ٻ�������������ظ�������)
    pop=recombin(pop,0.7);
    for j=1:7
        chrom(i,j*16-15:j*16)=pop(j,:);
    end
end
%�ɹ�������ʮ���µĽ⣬�����жϿ������,
% ���еĽ��ܣ������еĸ��ʽ��ܣ��õ��Ľ�����޸�main*�����ж�
res=zeros(10,112);
for i=1:10
    for j=1:16
        a=find(chrom(i,:)==j);
        da=diff(a);
        if isempty(find(da<12))~=1
            if rand()>0.2
                if j==16
                    res(i,:)=chrom(i,:);
                else
                end
            else
                break;
            end
        else
            if j==16
                res(i,:)=chrom(i,:);
            else
            end
        end
    end
end
%��������3~4�β���һ���µĿ��н⣬���˹��жϼ���









