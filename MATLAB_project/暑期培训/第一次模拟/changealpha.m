function [alpha1,alpha2,alpha3]=changealpha(A1,A2,A3)
%% ����ϵ����������һ��ָ���Ȩ��
% ��Ÿ����ҵ�A1��A2��A3��ƽ����
meana1=mean(A1);
meana2=mean(A2);
meana3=mean(A3);
% ��Ÿ����ҵ�A1��A2��A3�ı�׼��
stda1=std(A1);
stda2=std(A2);
stda3=std(A3);
% ��׼�����ƽ�����õ�1*3����������Ϊ����ϵ��
alpha=[stda1/meana1 stda2/meana2 stda3/meana3];
% alpha(3)=-alpha(3);
% alpha=alpha([3 1 2]);
% ����������ϵ���ĺ�
s=sum(alpha);
% ��ÿһ������ϵ�����Ժ͵�ֵ��ΪȨ��
alpha1=alpha(1)/s;
alpha2=alpha(2)/s;
alpha3=alpha(3)/s;


