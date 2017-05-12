clear all;
close all;
imax=62; %no of grid points in y direction
jmax=124; %no of grid points in x direction
L_x=60;L_y=30;
dy=L_y/(imax);
dx=L_x/(jmax);
dt=0.001;
x_c=0.55*L_x;
y_c=0.5*L_y;
c=[x_c,y_c];
%%%%%%%%Special treatment of the domain
%absolute coordinate system
%defined for only pressure nodes
%[x,y]=meshgrid(-dx/2:dx:L_x+dx/2,-dy/2:dy:L_y+dy/2)
x_u=ones(1,jmax);
y_v=ones(1,imax);
for i=1:jmax+1
x_u(i)=(i-1)*dx;
end
for i=1:jmax+1
    s=(i-1)/(jmax);
    x_u(i)=(3.5*s*(x_c-(L_x*s))*(1-s)+(L_x)*s);
end
for i=1:imax+1
    y_v(i)=(i-1)*dy;
end
for i=1:imax+1
    %for i=1:jmax+1
    s=(i-1)/(imax);
    y_v(i)=(3.5*s*(y_c-(L_y*s))*(1-s)+L_y*s);
end

x_p(1)=x_u(1)-dx/2;
for i=2:jmax+1
    x_p(i)=x_u(i)-(x_u(i)-x_u(i-1))*0.5;
end
x_p(end+1)=x_u(end)+dx/2;
%NOTE end=imax+1
y_p(1)=y_v(1)-dy/2;
for i=2:imax+1
y_p(i)=y_v(i)-(y_v(i)-y_v(i-1))*0.5;
end
y_p(end+1)=y_v(end)+dy/2;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%centre of the cylinder

%%%%%%%%%%%%%%%
%rho=0.1;
%mu=0.01;
Re=100;
r=1;
%grid_plotting(x_c,y_c,imax,jmax,x,y,r);
rho=1; %used for only Cd and Cl