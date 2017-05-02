function [Tnew] = adi_fourier(T,rhs,dx,dy)

    nx = size(T,1);
    ny = size(T,2);
    
    T_next = T;

    % adi in i-direction and fourier in j-direction

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
    Tnew=T_next';
end
