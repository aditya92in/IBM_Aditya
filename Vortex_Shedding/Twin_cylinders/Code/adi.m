function [T_next] = adi(T,rhs,dx,dy)

    nx = size(T,2);
    ny = size(T,1);
    
    T_next = T;

    % sweep i-direction

    a = zeros(nx-2,1);
    b = zeros(nx-2,1);
    c = zeros(nx-2,1);
    f = zeros(nx-2,1);
 
    for i=1:nx-2
        b(i)=   1.0;
        a(i)= - 2.0 - 2.0*(dx/dy)^2;
        c(i)=   1.0;
    end

    for j=2:ny-1
        for i=2:nx-1
            f(i-1) = rhs(i,j)*dx^2 - (T(i,j+1)+T_next(i,j-1))*(dx/dy)^2;
        end

        % boundary condition
        f(1)    = f(1)    - T(1,j);
        f(nx-2) = f(nx-2) - T(nx,j);

        f = tridiag(a,b,c,f);
        T_next(2:nx-1,j) = f(1:nx-2);
    end
    
    
    
    % sweep j-direction
    
    T = T_next;

    a = zeros(ny-2,1);
    b = zeros(ny-2,1);
    c = zeros(ny-2,1);
    f = zeros(ny-2,1);
       
    for j=1:ny-2
        b(j)=   1.0;
        a(j)= - 2.0 - 2.0*(dy/dx)^2;
        c(j)=   1.0;
    end

    for i=2:nx-1
        for j=2:ny-1
            f(j-1) = rhs(j,i)*dy^2 - (T(j+1,i)+T_next(j-1,i))*(dy/dx)^2;
        end

        % boundary condition
        f(1)    = f(1)    - T(i,1);
        f(ny-2) = f(ny-2) - T(i,ny);

        f = tridiag(a,b,c,f);
        T_next(i,2:ny-1) = f(1:ny-2);
    end

end