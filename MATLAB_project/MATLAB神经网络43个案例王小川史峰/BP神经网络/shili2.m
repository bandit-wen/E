p0 =[123.46, 155.54, 204.38, 290.94, 462.71, 688.19, 988.85, 1342.04, 1773.29, 2431.21, 3330.82, 4792.7, 4556.26, 5695.8, 7019.79, 9712.29, 12028.54];  
  
a=max(p0);  
b=min(p0);  
for i=1:17  
p0(i) = (p0(i)-b)/(a-b);  
end  
%���й�һ��  
  
  
for i = 1:11  
    p(:,i)=[p0(i); p0(i+1); p0(i+2); p0(i+3)];  
    t(i) = p0(i+4);  
end  
  
%��������ĸ�ֵ  
net=newff(minmax(p),[8,1],{'logsig','purelin'},'trainlm'),%����������  
net.trainParam.show = 100,%����ʾ�ļ��  
net.trainParam.epoch = 2000,%���ѵ������  
net.trainParam.goal= 1e-3,%ѵ������С�������  
[net,tr]=train(net,p,t);  
  
%�����������ѵ��  
  
ptest(:,1)=[p0(12) p0(13) p0(14) p0(15)]';  
ptest(:,2)=[p0(13) p0(14) p0(15) p0(16)]';  
ttest(1)=p0(16);  
ttest(2)=p0(17);  
%�γ�Ԥ������ݺ��������  
  
result_test = sim(net,p)  
result_test1 = sim(net,ptest)  
delta = result_test1-ttest%������Ԥ�ڵ����  
  
result = [result_test result_test1];