%% �Ľ׾����ʽ��������㷨
function val=lungkuta4(f, h)
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
    K1=feval(f,x(i-1),val(i-1));
    K2=feval(f,x(i-1)+h/2,val(i-1)+K1*h/2);
    K3=feval(f,x(i-1)+h/2,val(i-1)+K2*h/2);
    K4=feval(f,x(i-1)+h,val(i-1)+h*K3);
    val(i)=val(i-1)+h*(K1+2*K2+2*K3+K4)/6;
end
disp('���������£�')
val

