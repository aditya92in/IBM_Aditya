function res=check_nodes(x,y,x_c,y_c,r)

if(sqrt((power(x-x_c,2)+power(y-y_c,2)))>=r)
    res=0;
else
    res=1;


end
