function pp=pp(a)%�˸����к������0-10������ĸ���
pp=zeros(length(a),25);
for i=1:length(a)
    %����
    sum=0;
    for j=0:24
        pp(i,j+1)=poisspdf(j,a(i));
        sum=sum+pp(i,j+1);
    end
    pp(i,end)=1-sum;
end


