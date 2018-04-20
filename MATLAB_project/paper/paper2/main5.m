%% ��������������Ŀ��Ľ��������㷨�����ݽ��з���Ч��֮��Ĺ�ϵ
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
%% �������ɭ�ַ�����
x=2:19;
y=x;
for ii=2:19
    use=randperm(20,ii);%ÿ�����ѡ��4������
    use=sort(use);
    model=fitctree(input_train(:,use),trainres);
    [~,~,~,bestlevel]=cvLoss(model,'SubTrees','All','TreeSize','min');
    model = prune(model,'Level',bestlevel);
    temp_attribute_A=predict(model,input_train(:,use));
    temp_attribute_B=predict(model,input_test(:,use));
    error=find(temp_attribute_A~=trainres);
    temp_rate=length(error)/length(trainres);
    disp(['�������ǣ�',num2str(temp_rate*100),'%']);
    new_attribute_A=temp_attribute_A;
    new_attribute_B=temp_attribute_B;
    rate=1;
    for i=1:300
        i
        use=randperm(20,ii);%ÿ�����ѡ��4������
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
        disp(['�������ǣ�',num2str(temp_rate*100),'%']);
    end
    y(ii)=temp_rate;
end
plot(x,y(2:19));