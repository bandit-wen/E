function step=voger(half,maxkucun,dis)
%% ·�����
test=half-maxkucun;
outindex=find(test<0);%���˳�ȥ
inindex=find(test>0);%���˽���
dis=dis(:,outindex);
[temp,tempindex]=sort(dis);
d=temp(3,:)-temp(2,:);
[num,index]=sort(d,'descend');
firstenduse=outindex(index);%��������õ�����������Ⱥ�˳��
outnum=test(firstenduse);
innum=test(inindex);
i=1;j=1;
step=0;
while i<=length(outnum)&&j<=length(innum)
    if outnum(i)<innum(j)
        innum(j)=innum(j)+outnum(i);
        i=i+1;
    elseif outnum(i)==innum(j)
        i=i+1;
        j=j+1;
    else
        outnum(i)=outnum(i)+innum(j);
        j=j+1;
    end
    step=step+1;
end