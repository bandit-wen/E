function [T_sim,rf_err_rate] = rf(n,attribute,res,train_num,tree_num,sum,attri_num)
%% �������������
data=attribute;
%% �����������
input=data;%��������
output=res;%������ݡ���������
%% �����ȡ698������Ϊѵ��������340������ΪԤ������
input_train=input(n(1:train_num),:);%���ú����Ծ�����Ҫ��
trainres=output(n(1:train_num),:)+1;
input_test=input(n(train_num+1:sum),:);
outputres=output(n(train_num+1:sum),:)+1;%1��ԭ����0,2��ԭ����1
%% �������ɭ�ַ�����
model=classRF_train(input_train,trainres,tree_num,attri_num);
%% �������
[T_sim,votes]=classRF_predict(input_test,model);
rf_err_rate=1-length(find(T_sim==outputres))/length(T_sim);



