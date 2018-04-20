clear all
clc
close all

address=[pwd,'\ORL','\s'];

rows=112;
cols=92;
ClassNum=40;
tol_num=10;
image_fmt='.bmp';
train_samplesize=5;

%--------------------------------------------------------------------------
%------------------------PCA��ά
train=1:train_samplesize;
test=train_samplesize+1:tol_num;
%PCAά��
Eigen_NUM=40;

%ÿ��ѵ��������������������
train_num=length(train);
test_num=length(test);

%����ѵ����������������
[train_sample,train_label]=readsample(address,ClassNum,train,rows,cols,image_fmt);
[test_sample,test_label]=readsample(address,ClassNum,test,rows,cols,image_fmt);

%ѵ������������������������
train_tol=length(train_label);
test_tol=length(test_label);

%PCA��ά
Train_SET=train_sample';
[disc_set,disc_value,Mean_Image]=Eigenface_f(Train_SET,Eigen_NUM);

%ѵ������������������һ��ͶӰ
train_pro=disc_set'*train_sample';
test_pro=disc_set'*test_sample';

%ѵ�����������ֵ��ÿ���ֵ
total_mean=mean(train_pro,2);
EachClassMean=zeros(Eigen_NUM,ClassNum);
EachClassNum=zeros(1,ClassNum);
for i=1:ClassNum
    temp=train_pro(:,(i==train_label));
    EachClassMean(:,i)=mean(temp,2);
    EachClassNum(i)=sum((i==train_label));
end

%����Fai_b��Fai_w���Ա����Sb��Sw
Fai_b=zeros(Eigen_NUM,ClassNum);
Fai_w=zeros(Eigen_NUM,train_tol);
for i=1:ClassNum
    temp=EachClassMean(:,i)-total_mean;
    Fai_b(:,i)=sqrt(EachClassNum(i))*temp;
end
for i=1:train_tol
    Fai_w(:,i)=train_pro(:,i)-EachClassMean(:,train_label(i));
end
Sb=Fai_b*Fai_b';
Sw=Fai_w*Fai_w';

%��������ֵ�ֽ⣬�õ�LDA��ͶӰ����
LDA_dim=ClassNum-1;
% LDA_dim=12;
[eig_vec,eig_val]=eig(Sb,Sw);
d=diag(eig_val)';
[sorted_d,ind]=sort(d,'descend');
sorted_vec=eig_vec(:,ind);
W_LDA=sorted_vec(:,1:LDA_dim);

%ѵ�����������������ٴ�ͶӰ
train_final=W_LDA'*train_pro;
test_final=W_LDA'*test_pro;

%��������ڷ������Բ�����������
Sample=test_final';
Training=train_final';
Group=train_label';
k=1;
distance='euclidean';
Class = knnclassify(Sample, Training, Group, k, distance);
accuracy=sum(test_label==Class')/test_tol;

%---------------------------------�����ʾ----------------------------------
fprintf('ÿ��ѵ��������Ϊ��%d\n',train_samplesize);
fprintf(2,'FisherFace��ʶ����Ϊ��%.2f%%\n\n',accuracy*100);
