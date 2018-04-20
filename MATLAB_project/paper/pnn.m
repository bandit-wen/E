function [output_fore,err_rate] = pnn(n,attribute,res,train_num,ssum)
%% �����������
res=res+1;%�����в�������0���ڣ�Ҫ�ǵý�����ع�
input=attribute;
output=res;
P_train=input(n(1:train_num),:)';
T_train=output(n(1:train_num),:)';
P_test=input(n(train_num+1:ssum),:)';
T_test=output(n(train_num+1:ssum),:)';
%% ģ�ͽ��� 
result_pnn = [];
time_pnn = [];
for i = 1:20
    for j = i:20
        p_train = P_train(i:j,:);
        p_test = P_test(i:j,:);
       %% PNN�������������
        t = cputime;
        Tc_train = ind2vec(T_train);
        % ��������
        net_pnn = newpnn(p_train,Tc_train);
        % �������
        Tc_test = ind2vec(T_test);
        t_sim_pnn = sim(net_pnn,p_test);
        T_sim_pnn = vec2ind(t_sim_pnn);
        t = cputime - t;
        time_pnn = [time_pnn t];
        result_pnn = [result_pnn T_sim_pnn'];
    end
end

%% ��������

% ��ȷ��accuracy
accuracy_pnn = [];
time = [];
for i = 1:size(result_pnn,2)
    accuracy_2 = length(find(result_pnn(:,i) == T_test'))/length(T_test);
    accuracy_pnn = [accuracy_pnn accuracy_2];
end
%% ��ͼ
figure(1)
plot(1:ssum-train_num,T_test,'bo',1:ssum-train_num,result_pnn(:,20),'r*')
grid on
xlabel('���Լ��������')
ylabel('���Լ��������')
string = {'���Լ�Ԥ����';['��ȷ��:' num2str(accuracy_pnn(20)*100) '%(PNN)']};
title(string)
legend('��ʵֵ','PNNԤ��ֵ')
output_fore=result_pnn(:,20);
err_rate=1-accuracy_pnn(20);
