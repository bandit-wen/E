clear
clc
a=[4.1 3.2 5.0 4.0 3.7 3.5 2.3 2.1];
aa=a;
p=pp(aa);
for i=1:12
    p(:,i)=p(:,i*2-1)+p(:,i*2);
end
p=p(:,1:12);
e=e();
res=e*p';%12*8,12��12����棬8�ǰ˸�����
%% d
x=0:11;
figure(1);
plot(x,res(:,1));
hold on
plot(x,res(:,2),'r');
plot(x,res(:,3),'b');
plot(x,res(:,4),'m');
plot(x,res(:,5),'y');
plot(x,res(:,6),'c');
plot(x,res(:,7),'g');
plot(x,res(:,8),'k');
legend('����1','����2','����3','����5','����6','����7','����8','����9');
title('�˸����п��-��������ͼ');
xlabel('���');
ylabel('����');
grid on
hold off


