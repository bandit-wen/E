%% �Ľ���ŷ���㷨
function val=ModiEuler(f,h)
%f��һ�׳�΢�ַ��̵��Ҷ˺���
%���磺f=@(x,y) y-2*x/y
%h�ǻ��ֲ���
%% �㷨ʵ��
low=input('�������Ա������ޣ�low=');
high=input('�������Ա������ޣ�high=');
first=input('�����뺯����ֵ:first=');
N=(high-low)/h;
val=zeros(N+1,1);
val(1)=first;
x=low:h:high;
for i=2:N+1
        v1=feval(f,x(i-1),val(i-1));
        temp=val(i-1)+h*v1;
        v2=feval(f,x(i),temp);
        temp2=val(i-1)+h*v2;
        val(i)=(temp+temp2)/2;
end
disp('���������£�')
val

