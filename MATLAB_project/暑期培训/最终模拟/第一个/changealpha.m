function [alpha1,alpha2,alpha3]=changealpha(A1,A2,A3)
%% ����ϵ����������һ��ָ���Ȩ��
% ��Ÿ����ҵ�A1��A2��A3��ƽ����
meana1=mean(A1);
meana2=mean(A2);
meana3=mean(A3);
% meana4=mean(A4);
% ��Ÿ����ҵ�A1��A2��A3�ı�׼��
stda1=std(A1);
stda2=std(A2);
stda3=std(A3);
% stda4=std(A4);
% ��׼�����ƽ�����õ�1*3����������Ϊ����ϵ��
% alpha=[stda1/meana1 stda2/meana2 stda3/meana3 stda4/meana4];
alpha=[stda1/meana1 stda2/meana2 stda3/meana3];
% ����������ϵ���ĺ�
s=sum(alpha);
% ��ÿһ������ϵ�����Ժ͵�ֵ��ΪȨ��
alpha1=alpha(1)/s;
alpha2=alpha(2)/s;
alpha3=alpha(3)/s;
% alpha4=alpha(4)/s;


