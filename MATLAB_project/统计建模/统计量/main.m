load data.txt
%% ��Ƶ��ֱ��ͼ
high=data(:,1:2:9);
high=high(:);
weight=data(:,2:2:10);
weight=weight(:);
[n1,x1]=hist(high);
[n2,x2]=hist(weight);
subplot(1,2,1);
hist(high)
subplot(1,2,2);
hist(weight)
%% ƽ��������λ������׼����������ľ࣬ƫ�ȣ����
shuju=[high weight];
jun_zhi=mean(shuju);
zhong_wei_shu=median(shuju);
biao_zhun_cha=std(shuju);
fang_cha=var(shuju);
ji_cha=range(shuju);
zhong_xin_jv=moment(shuju,2);%�ڶ������������ľصĽ���
pian_du=skewness(shuju);
feng_du=kurtosis(shuju);
%% �ֲ�����(��һ�е����ֿ��ԺͶ����е����ֻ������)
%norm ��̬�ֲ�;chi2  ��^2 �ֲ�;t       t �ֲ�;f       F �ֲ�;
% pdf �����ܶȣ� cdf �ֲ������� inv �ֲ������ķ�������
% stat ��ֵ�뷽� rnd ���������
x=-6:0.01:6;y=normpdf(x);z=normpdf(x,0,2);
plot(x,y,x,z),gtext('N(0,1)'),gtext('N(0,2^2)');
%% ��������
[mu,sigma,muci,sigmaci]=normfit(x,alpha);
%% �������




