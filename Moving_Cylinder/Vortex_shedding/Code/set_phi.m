function phi=set_phi(phi,imax,jmax,x_c,y_c,x,y,r)
for i=1:jmax+2
    for j=1:imax+2
        if(check_nodes(x(j,i),y(j,i),x_c,y_c,r)==1)
            phi(j,i)=1;
            %plot(x(i,j),y(i,j),'.m','MarkerSize',10);
        else
            phi(j,i)=0;
           % plot(x(i,j),y(i,j),'.g','MarkerSize',10);
        end
    end
end
end