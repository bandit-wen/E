function p=p(a)%�˸�����0-10������ĸ���
p=zeros(length(a),12);
for i=1:length(a)
    %����
    sum=0;
    for j=0:11
        p(i,j+1)=poisspdf(j,a(i));
        sum=sum+p(i,j+1);
    end
    p(i,end)=1-sum;
end


