load res.mat
x=0:14;
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


