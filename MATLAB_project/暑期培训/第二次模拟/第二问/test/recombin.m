function pop=recombin(pop,Pc)
NSel=size(pop,1);
for i=1:2:NSel-mod(NSel,2)
    if Pc>=rand %�������Pc
        [pop(i,:),pop(i+1,:)]=intercross(pop(i,:),pop(i+1,:));
    end
end
