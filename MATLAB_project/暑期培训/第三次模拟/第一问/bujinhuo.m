function in=bujinhuo(maxe,res,kucun)
border=maxe-100;
in=zeros(1,8);
res=res';
for i=1:8
    for j=1:kucun(i)
        if res(i,j)>border(i)
            in(i)=j-1;%����Ҫ��������С�����
            break;
        end
    end
end