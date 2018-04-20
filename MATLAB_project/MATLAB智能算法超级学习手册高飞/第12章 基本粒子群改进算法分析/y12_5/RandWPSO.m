function [xm,fv] = RandWPSO(fitness,N,c1,c2,mean_max,mean_min,sigma,M,D)

format long;

%------初始化种群的个体------------

for i=1:N

    for j=1:D

        x(i,j)=randn;  %随机初始化位置

        v(i,j)=randn;  %随机初始化速度

    end

end

%------先计算各个粒子的适应度，并初始化Pi和Pg----------------------

for i=1:N

    p(i)=fitness(x(i,:));

    y(i,:)=x(i,:);

end

pg = x(N,:);             %Pg为全局最优

for i=1:(N-1)

    if fitness(x(i,:))<fitness(pg)

        pg=x(i,:);

    end

end

%------进入主要循环，按照公式依次迭代------------

for t=1:M

    for i=1:N
        
        miu = mean_min + (mean_max - mean_min)*rand();
        
        w = miu + sigma*randn();
        
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));

        x(i,:)=x(i,:)+v(i,:);

        if fitness(x(i,:))<p(i)

            p(i)=fitness(x(i,:));

            y(i,:)=x(i,:);

        end

        if p(i)<fitness(pg)

            pg=y(i,:);

        end

    end

    Pbest(t)=fitness(pg);
end
r=[1:1:100];
plot(r,Pbest,'r--','linewidth',2);
xlabel('迭代次数')
ylabel('适应度值')
title('改进PSO算法收敛曲线')
legend('随机权重PSO算法')
grid on
hold on

xm = pg';
fv = fitness(pg);



