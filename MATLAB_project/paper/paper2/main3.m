%% ������Ľ��������㷨�����ݽ��з���
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
res=res+1;
%% �����������
input=data;%��������
output=res;%������ݡ���������
%% �����ȡ698������Ϊѵ��������340������ΪԤ������
P_train=input(n(1:train_num),:)';
T_train=output(n(1:train_num),:)';
P_test=input(n(train_num+1:ssum),:)';
T_test=output(n(train_num+1:ssum),:)';
%% ֧������������һ��Ԥ��
result_pnn_train = [];
result_pnn_test = [];
for i = 1:20
    for j = i:20
        p_train = P_train(i:j,:);
        p_test = P_test(i:j,:);
        Tc_train = ind2vec(T_train);
        % ��������
        net_pnn = newpnn(p_train,Tc_train);
        %% PNN��֤ѵ����
        Tc_trian = ind2vec(T_train);
        t_sim_pnn = sim(net_pnn,p_train);
        T_sim_pnn = vec2ind(t_sim_pnn);
        result_pnn_train = [result_pnn_train T_sim_pnn'];
        %% PNN�������������
        Tc_test = ind2vec(T_test);
        t_sim_pnn = sim(net_pnn,p_test);
        T_sim_pnn = vec2ind(t_sim_pnn);
        result_pnn_test = [result_pnn_test T_sim_pnn'];
    end
end
% ��ȷ��accuracy
accuracy_pnn_train = [];
for i = 1:size(result_pnn_train,2)
    accuracy_2 = length(find(result_pnn_train(:,i) == T_train'))/length(T_train);
    accuracy_pnn_train = [accuracy_pnn_train accuracy_2];
end
accuracy_pnn_test = [];
for i = 1:size(result_pnn_test,2)
    accuracy_2 = length(find(result_pnn_test(:,i) == T_test'))/length(T_test);
    accuracy_pnn_test = [accuracy_pnn_test accuracy_2];
end
check=result_pnn_train(:,20);
solution=result_pnn_test(:,20);
pnn_train_error_rate=accuracy_pnn_train(20);
pnn_error_rate=accuracy_pnn_test(20);
%% �������ɭ�ַ�����
temp_attribute_A=check;
temp_attribute_B=solution;
error=pnn_train_error_rate;
temp_rate=pnn_error_rate;
disp(['�������ǣ�',num2str(temp_rate*100),'%']);
new_attribute_A=temp_attribute_A;
new_attribute_B=temp_attribute_B;
rate=1;
x=1:500;
y=x;
P_train=P_train';
T_train=T_train';
P_test=P_test';
T_test=T_test';
for i=1:500
    i
    use=randperm(20,4);%ÿ�����ѡ��4������
    use=sort(use);
    if temp_rate<=rate
        rate=temp_rate;
        new_attribute_A=temp_attribute_A;
        new_attribute_B=temp_attribute_B;
    end
    model=fitctree([P_train(:,use),new_attribute_A],T_train);
    [~,~,~,bestlevel]=cvLoss(model,'SubTrees','All','TreeSize','min');
    model = prune(model,'Level',bestlevel);
    temp_attribute_A=predict(model,[P_train(:,use),new_attribute_A]);
    temp_attribute_B=predict(model,[P_test(:,use),new_attribute_B]);
    error=find(temp_attribute_A~=T_train);
    temp_rate=length(error)/length(T_train);
    disp(['ѵ���������ǣ�',num2str(temp_rate*100),'%']);
    error_rate=length(find(temp_attribute_B~=T_test))/length(T_test);
    disp(['ѵ���������ǣ�',num2str(error_rate*100),'%']);
    y(i)=error_rate;
end
plot(x,y);


