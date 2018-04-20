function graph(rel,control)  
%���ڽӾ���ͼ  
%����Ϊ�ڽӾ��󣬱���Ϊ����  
%�ڶ�������Ϊ��������0��ʾ����ͼ��1��ʾ����ͼ��Ĭ��ֵΪ0  
r_size=size(rel);%��ȡ�����С  
if nargin<2 %�������С��2��Ĭ������ͼ  
    control=0;  
end  
if r_size(1)~=r_size(2)  
    disp('Wrong Input! The input must be a square matrix!');%����Ϊ�ڽӾ��󣬱���Ϊ����  
    return;  
end  
len=r_size(2);  
!echo len;  
disp(len);  
  
rho=10;%����ͼ�ߴ�Ĵ�С  
r=1/1.05^len;%��İ뾶  
theta=0:(2*pi/len):2*pi*(1-1/len);%��0��ʼ������2*pi/len������2*pi*(1-1/len)���൱����len����  
[pointx,pointy]=pol2cart(theta',rho);  
theta=0:pi/36:2*pi;%73����  
!echo theta:  
disp(theta);  
[tempx,tempy]=pol2cart(theta',r);%73������  
point=[pointx,pointy];%6�������  
!echo point;  
disp(point);  
hold on  
for i=1:len  
    temp=[tempx,tempy]+[point(i,1)*ones(length(tempx),1),point(i,2)*ones(length(tempx),1)];%73��1�е�1������pointÿ���������  
    plot(temp(:,1),temp(:,2),'r');%plot(x,y),����ԲȦ  
     %plot(point(:,1),point(:,2),'r');%plot(x,y)  
    text(point(i,1)-0.3,point(i,2),num2str(i));  
    %����  
end  
for i=1:len  
    for j=1:len  
        if rel(i,j)%����ڽӾ���rel�иõ���1����������  
            link_plot(point(i,:),point(j,:),r,control);  
            %�����й�ϵ�ĵ�  
        end  
    end  
end  
set(gca,'XLim',[-rho-r,rho+r],'YLim',[-rho-r,rho+r]);  
axis off  

