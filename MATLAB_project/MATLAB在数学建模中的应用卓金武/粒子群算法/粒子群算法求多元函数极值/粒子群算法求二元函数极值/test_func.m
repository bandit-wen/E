function fitness=test_func(individual)
%% �������ӵ���Ӧ��
%individual    ���Ӹ���
%fitness    ��Ӧ��ֵ
x=individual(:,1);
y=individual(:,2);
for i=1:size(individual,1)
    fitness(i,:)=0.5*(x(i)-3)^2+0.2*(y(i)-5)^2-0.1;
end