function [sample,label]=readsample(address,ClassNum,data,rows,cols,image_fmt)
%�������������ȡ������
%���룺
%address��Ҫ��ȡ��������·��
%ClassNum������Ҫ���������������
%data������
%rows����������
%cols����������
%image_fmt��ͼƬ��ʽ

%�����
%sample����������ÿ��Ϊһ��������ÿ��Ϊһ������
%label����ǩ����

ImageSize=rows*cols;
sample_tol=ClassNum*length(data);%�������������
sample=zeros(sample_tol,ImageSize);
label=zeros(1,sample_tol);
m=1;
for i=1:ClassNum
    for j=data
        a=imread(strcat(address,num2str(i),'_',num2str(j),image_fmt));
        a=imresize(a,[rows cols]);
        b=double(reshape(a,1,ImageSize));
        sample(m,:)=b;
        label(m)=i;
        m=m+1;
    end
end