clear all
clc
close all
start=clock;
sample_class=1:40;%�������
sample_classnum=size(sample_class,2);%���������
fprintf('�������п�ʼ....................\n\n');

for train_samplesize=3:8;
    train=1:train_samplesize;%ÿ��ѵ������
    test=train_samplesize+1:10;%ÿ���������
    
    train_num=size(train,2);%ÿ��ѵ��������
    test_num=size(test,2);%ÿ�����������
    
    address=[pwd '\ORL\s'];
    %��ȡѵ������
    allsamples=readsample(address,sample_class,train);
    
    %��ʹ��PCA���н�ά
    [newsample base]=pca(allsamples,0.9);
    %����Sw,Sb
    [sw sb]=computswb(newsample,sample_classnum,train_num);
    
    %��ȡ��������
    testsample=readsample(address,sample_class,test);
    best_acc=0;%����ʶ����
    %Ѱ�����ͶӰά��
    for temp_dimension=1:1:length(sw)
        vsort1=projectto(sw,sb,temp_dimension);
        
        %ѵ�������Ͳ��������ֱ�ͶӰ
        tstsample=testsample*base*vsort1;
        trainsample=newsample*vsort1;
        %����ʶ����
        accuracy=computaccu(tstsample,test_num,trainsample,train_num);
        if accuracy>best_acc
            best_dimension=temp_dimension;%�������ͶӰά��
            best_acc=accuracy;
        end
    end
    %---------------------------------�����ʾ----------------------------------
    fprintf('ÿ��ѵ��������Ϊ��%d\n',train_samplesize);
    fprintf('���ͶӰά��Ϊ��%d\n',best_dimension);
    fprintf('FisherFace��ʶ����Ϊ��%.2f%%\n',best_acc*100);
    fprintf('��������ʱ��Ϊ��%3.2fs\n\n',etime(clock,start));
end
fprintf('�������н���....................\n\n');