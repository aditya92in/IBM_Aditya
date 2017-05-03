function [p,err_pos]=solve_poisson(rhs,imax,jmax,dx,dy,pnew)
 dx2=1/dx^2;dy2=1/dy^2;
 err=1;
piter=pnew;
%pnew=piter;
count=1;
tic
%omega=1.5;
while(err>1e-8)&&(count<20)
    %boundary conditions
    %piter(:,1)=piter(:,2); %dp/dx=0;
    %piter(:,end)=-piter(:,end-1); %P=0
    %piter(1,:)=piter(2,:);%dp/dy=0; south boundary
    %piter(end,:)=piter(end-1,:);%dp/dy=0 ;north boundary
%     pnew(:,1)=pnew(:,2); %dp/dx=0;
%     pnew(:,end)=-pnew(:,end-1); %P=0
%     pnew(1,:)=pnew(2,:);%dp/dy=0; south boundary
%     pnew(end,:)=pnew(end-1,:);%dp/dy=0 ;north boundary
   
% for i=2:imax+1
%     for j=2:jmax+1
%         piter(i,j)=piter(i,j)*(1-omega)+omega*0.5*((piter(i,j-1)+pnew(i,j+1)).*power(dy2,-1)+(pnew(i+1,j)+piter(i-1,j)).*power(dx2,-1)-rhs(i,j)*power(dx2,-1)*power(dy2,-1))./(power(dx2,-1)+power(dy2,-1));
%         piter(i,j)=0.5*((piter(i,j-1)+pnew(i,j+1)).*power(dy2,-1)+(pnew(i+1,j)+piter(i-1,j)).*power(dx2,-1)-rhs(i,j)*power(dx2,-1)*power(dy2,-1))./(power(dx2,-1)+power(dy2,-1));
%     end
%  end

piter=adi_fourier(pnew',rhs',dx,dy);

err_pos=norm(pnew(2:end-1,2:end-1)-piter(2:end-1,2:end-1));

%plot(count,err,'.','MarkerSize',10);
%hold all
count=count+1;
%pause(0.1)
pnew=piter;
end
    pnew(:,1)=pnew(:,2); %dp/dx=0; WEST
    pnew(:,end)=-pnew(:,end-1); %P=0 EAST
    pnew(1,:)=pnew(2,:);%dp/dy=0; south boundary
    pnew(end,:)=pnew(end-1,:);%dp/dy=0 north boundary
    p=pnew;
    %disp(['time spent in poissson=',num2str(toc)]);
    
end
