%% �������೵�����
% x=[24   54   19   22];120�೵
% 0-120                   5                 80                    24
% 120-606               9                 70                    54
% 606-720               6                 80                    19
% 720-874               7                 75                    22
%% һ�����õ�ʱ�̱�
%����ʱ�̱�
time=[0:5:120 129:9:606 612:6:720 727:7:874];
%��¼����˳��
array=[1:16 zeros(1,104)];
index=16;
for i=17:32
    if time(i)-time(i-16)>=80;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=33:51
    if time(i)-time(i-14)>=70;
        array(i)=array(i-14);
    else
        index=index+1;
        array(i)=index;
    end
end
array(52)=1;
array(53)=2;
for i=54:62
    if time(i)-time(i-16)>=70;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
if time(63)-time(52)>=70;
    array(63)=array(52);
else
    index=index+1;
    array(i)=index;
end
if time(64)-time(53)>=70;
    array(64)=array(53);
else
    index=index+1;
    array(i)=index;
end
for i=65:69
    if time(i)-time(i-18)>=70;
        array(i)=array(i-18);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=70:78
    if time(i)-time(i-16)>=70;
        array(i)=array(i-16);
    else
        index=index+1;
        array(i)=index;
    end
end
if time(79)-time(65)>=70;
    array(79)=array(65);
else
    index=index+1;
    array(i)=index;
end
if time(80)-time(66)>=70;
    array(80)=array(66);
else
    index=index+1;
    array(i)=index;
end
for i=81:99
    if time(i)-time(i-14)>=80;
        array(i)=array(i-14);
    else
        index=index+1;
        array(i)=index;
    end
end
for i=100:120
    if time(i)-time(i-14)>=75;
        array(i)=array(i-14);
    else
        index=index+1;
        array(i)=index;
    end
end
%% ���������������Сʱ����
for i=38:46
    if time(i)-time(i-30)>480
        disp('ʱ�䳬����Сʱ');
    end
end
for i=47:51
    if time(i)-time(i-44)>480
        disp('ʱ�䳬����Сʱ');
    end
end
% ����
for i=112:120
    if time(i)-time(i-58)>480
        disp('ʱ�䳬����Сʱ');
    end
end
for i=107:111
    if time(i)-time(i-42)>480
        disp(array(i));
        disp('ʱ�䳬����Сʱ');
    end
end

%% ����ÿ��������������ʱ������۲���
shangwu=zeros(1,16);
shangwu(1:2)=160;
shangwu(3:7)=time(47:51)-time(3:7);
shangwu(8:16)=time(38:46)-time(8:16);
xiawu=zeros(1,16);
xiawu(1:2)=160;
xiawu(3:7)=time(107:111)-time(65:69);
xiawu(8:16)=time(112:120)-time(54:62);
res=shangwu-xiawu;
res=res.^2;
res=sqrt(sum(res)/16);