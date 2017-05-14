function [u]=intialconditions(u,nx,ny,x,y)
  for i=1:nx
      for j=1:ny
      if(x(i,j)>=3.5)&&(x(i,j)<=4.5)&&(y(i,j)>=3.5)&&(y(i,j)<=4.5)
          u(i,j)=2;
      else
          u(i,j)=0;
      end
      end
  end
end