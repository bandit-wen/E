%% �������㷨�����ݽ��з���
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

%% ʹ�������編���з���

[res1,pnn_err_rate] = pnn(n,attribute,res,train_num,ssum);
disp(['�������㷨�Ĵ������ǣ�',num2str(pnn_err_rate*100),'%']);
fprintf('%c\n',' ');

%% ʹ��֧�����������з���

rbf='rbf';
[res2,svm_err_rate] = svm(n,attribute,res,train_num,rbf,ssum);
disp(['֧���������㷨�Ĵ������ǣ�',num2str(svm_err_rate*100),'%']);

%% ʹ�����ɭ�ַ����з���

tree_num=80;
attri_num=4;
[res3,rf_err_rate]=rf(n,attribute,res,train_num,tree_num,ssum,attri_num);
disp(['the error rate of Random forest algorithm ��',num2str(rf_err_rate*100),'%']);

%% ��һ�ַ���

rate=plan1(n,res,res1,res2,res3,train_num,ssum);
disp(['�㷨�Ĵ������ǣ�',num2str(rate*100),'%']);

%% ����(��ѵ���������ʹ����ʵĹ�ϵ���ô���)

% tttt=zeros(34,1);
% for i=1:1:10
%     for train_num=10:10:340
%         [res2,svm_err_rate] = svm(k,n,attribute,res,train_num,'rbf');
%         disp(['֧���������㷨�Ĵ������ǣ�',num2str(svm_err_rate*100),'%']);
%         tttt(train_num/10,1)=tttt(train_num/10,1)+svm_err_rate*100;
%     end
% end
% tttt=tttt./10;
% disp(tttt);
% plot(1:34,tttt');
% xlabel('ѵ����������10����');
% ylabel('�����ʣ�%��');
% title('ѵ��������Ŀ������ʵĹ�ϵ');
