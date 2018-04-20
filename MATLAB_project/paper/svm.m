function [solution,svm_error_rate] = svm(n,attribute,res,train_num,rbf,sum)
%% �������������
data=attribute;
%% �����������
input=data;%��������
output=res;%������ݡ���������
%% �����ȡ698������Ϊѵ��������340������ΪԤ������
input_train=input(n(1:train_num),:)';%���ú����Ծ�����Ҫ��
trainres=output(n(1:train_num),:);
input_test=input(n(train_num+1:sum),:)';
outputres=output(n(train_num+1:sum),:);
%% �������ݹ�һ��
[inputn,inputps]=mapminmax(input_train);%ѵ�����ݹ�һ��
inputn_test=mapminmax('apply',input_test,inputps);%�������ݹ�һ��,inputps�������Ϊ��һ��input_trainʹ�õķ���
s=svmtrain(inputn',trainres,'Kernel_Function',rbf);%��������doc svmtrain�鿴�����Ĳ���
sv_index=s.SupportVectorIndices;%���ĸ����ǲ���
sv_Alpha=s.Alpha;
sv_Bias=s.Bias;
mean_and_std_trains=s.ScaleData;
check=svmclassify(s,inputn');
svm_train_error_rate=1-length(find(check==trainres))/length(trainres);%�ҵ�������
solution=svmclassify(s,inputn_test');%�Բ������ݽ��м��
svm_error_rate=1-length(find(solution==outputres))/length(outputres);%�ҵ�������
