function dummy=grid_plotting(x,y,imax,jmax,c)

for i=1:jmax+1  %outer loop traverses across x (the index name 'i' does not matter)
    for j=1:imax+2 %inner loop traverses across y
        plot(x(i,j),'x','MarkerSize',10);
        hold all
    end
end
for i=1:jmax+2
    for j=1:imax+1
        plot(y(i,j),'o','MarkerSize',10);
        hold all
    end
end



end