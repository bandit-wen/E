%% svm�Ľ��������㷨�����ݽ��з���
%% ��������
%�˲��ֽ�����resΪ346*1���������������ŵ�����
%attributeΪ346*20�ľ���346������������20����������
close all;
clear;
clc;
[res,attribute]=deal();
ssum=size(res,1);
index=randperm(346,100);
index=[index index.*2 index.*3];
index=unique(index);
n=zeros(1,ssum-length(index));
temp=1;
for i=1:ssum
    if ismember(i,index)
    else
        n(temp)=i;
        temp=temp+1;
    end
end
n=[n index];
train_num=ssum-length(index);
%% �������������
data=attribute;
%% �����������
input=data;%��������
output=res;%������ݡ���������
%% �����ȡ698������Ϊѵ��������340������ΪԤ������
input_train=input(n(1:train_num),:);%���ú����Ծ�����Ҫ��
trainres=output(n(1:train_num),:)+1;
input_test=input(n(train_num+1:ssum),:);
outputres=output(n(train_num+1:ssum),:)+1;%1��ԭ����0,2��ԭ����1
%% ֧������������һ��Ԥ��
[inputn,inputps]=mapminmax(input_train');%ѵ�����ݹ�һ��
inputn_test=mapminmax('apply',input_test',inputps);%�������ݹ�һ��,inputps�������Ϊ��һ��input_trainʹ�õķ���
s=svmtrain(inputn',trainres,'Kernel_Function','rbf');%��������doc svmtrain�鿴�����Ĳ���
sv_index=s.SupportVectorIndices;%���ĸ����ǲ���
sv_Alpha=s.Alpha;
sv_Bias=s.Bias;
mean_and_std_trains=s.ScaleData;
check=svmclassify(s,inputn');
svm_train_error_rate=1-length(find(check==trainres))/length(trainres);%�ҵ�������
solution=svmclassify(s,inputn_test');%�Բ������ݽ��м��
svm_error_rate=1-length(find(solution==outputres))/length(outputres);%�ҵ�������
%% �������ɭ�ַ�����
temp_attribute_A=check;
temp_attribute_B=solution;
error=svm_train_error_rate;
temp_rate=svm_error_rate;
disp(['�������ǣ�',num2str(temp_rate*100),'%']);
new_attribute_A=temp_attribute_A;
new_attribute_B=temp_attribute_B;
rate=1;
x=1:1000;
y=x;
for i=1:1000
    i
    use=randperm(20,4);%ÿ�����ѡ��4������
    use=sort(use);
    if temp_rate<=rate
        rate=temp_rate;
        new_attribute_A=temp_attribute_A;
        new_attribute_B=temp_attribute_B;
    end
    model=fitctree([input_train(:,use),new_attribute_A],trainres);
    [~,~,~,bestlevel]=cvLoss(model,'SubTrees','All','TreeSize','min');
    model = prune(model,'Level',bestlevel);
    temp_attribute_A=predict(model,[input_train(:,use),new_attribute_A]);
    temp_attribute_B=predict(model,[input_test(:,use),new_attribute_B]);
    error=find(temp_attribute_A~=trainres);
    temp_rate=length(error)/length(trainres);
    disp(['ѵ���������ǣ�',num2str(temp_rate*100),'%']);
    error_rate=length(find(temp_attribute_B~=outputres))/length(outputres);
    disp(['ѵ���������ǣ�',num2str(error_rate*100),'%']);
    y(i)=error_rate;
end
plot(x,y);


