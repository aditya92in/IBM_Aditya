clear all;
close all;
nx=101;dt=1;c=1;mu=2;ny=101;
[x,y]=meshgrid(linspace(0,6,nx),linspace(0,4,ny));
dx=6/(nx-1);dy=4/(ny-1);
u=zeros(ny,nx);
u=intialconditions(u,nx,ny,x,y);
%unew=u;
res_x=1;
%contourf(x,y,u);
nit=500;
a1=(mu*dt)/(dx^2);
a2=(mu*dt)/(dy^2);
a3=1+(2*a1)+(2*a2);
count_star=1;
for k=0:dt:1000
    %uold=unew;
    u_new_iter=u;
    u_iter=u;
    
     res_x=1;
     
     %u_new_old_iter(:,end)=0;
      %u_new_old_iter(:,1)=0;
       %u_new_old_iter(end,:)=0;
       %u_new_old_iter(1,:)=0;

         count_star=1;
         
      while(res_x>1e-6) &&(count_star<20)
      for i=2:ny-1
        for j=2:nx-1
            u_new_iter(i,j)= u(i,j)/a3 + ...
                a1*(u_new_iter(i,j-1)+u_iter(i,j+1))*power(a3,-1) +...
            a2*(u_new_iter(i-1,j)+u_iter(i+1,j))*power(a3,-1);
        end
       end
%        u_new_new_iter(:,end)=0;
%       u_new_new_iter(:,1)=0;
%       u_new_new_iter(end,:)=0;
%       u_new_new_iter(1,:)=0;
%        
       res_x=norm(u_new_iter(2:end-1,2:end-1)-u_iter(2:end-1,2:end-1));
       
       count_star=count_star+1;
      
       
         u_iter=u_new_iter;
       
      end
      disp(['residual ',num2str(res_x)]);
      u=u_new_iter;
      contourf(x,y,u);
      %caxis([0 2])
      title(num2str(k*dt))
      colorbar;
      pause(0.001);
      
end