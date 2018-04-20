close;
clear;
clc;
%% 2015
num15=xlsread('2015');%14*9
maxval=zeros(14,1);
for i=1:14
    maxval(i)=max(num15(i,:));
end
minval=zeros(14,1);
for i=1:14
    minval(i)=min(num15(i,:));
end
res=zeros(14,9);
for i=1:9
    res(:,i)=(num15(:,i)-minval)./(maxval-minval);
end
res=1-res;
for i=1:9
    figure(i)
    x=1:14;
    y=res(:,i);
    y=y';
    bar(x,y);
    xlabel('����');
    ylabel('���跢չ�̶�');
    switch(i)
        case 1
            title('�人��ָ�����չ�̶�ֱ��ͼ');
        case 2
            title('�Ƹ���ָ�����չ�̶�ֱ��ͼ');
        case 3
            title('��ʯ��ָ�����չ�̶�ֱ��ͼ');
        case 4
            title('������ָ�����չ�̶�ֱ��ͼ');
        case 5
            title('Т����ָ�����չ�̶�ֱ��ͼ');
        case 6
            title('������ָ�����չ�̶�ֱ��ͼ');
        case 7
            title('������ָ�����չ�̶�ֱ��ͼ');
        case 8
            title('������ָ�����չ�̶�ֱ��ͼ');
        case 9
            title('Ǳ����ָ�����չ�̶�ֱ��ͼ');
    end;
    set(gca,'XTickLabel',{'��������ֵ';'�˾�GDP';'��ģ���Ϲ�ҵ�ܲ�ֵ';...
    'ȫ�в�������';...
    '���̶��ʲ�Ͷ��';'�������Ʒ�����ܶ�';'�������ܶ�';...
    '����Ԥ��������';...
    '�����˾���֧������';'ũ���˾���֧������';...
    '����ҽ�ƻ���������';'��һ��ҵռ��';...
    '�ڶ���ҵռ��';'������ҵռ��'});
end

