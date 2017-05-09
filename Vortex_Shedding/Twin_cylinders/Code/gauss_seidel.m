% Gauss-Seidel 
function [T_next] = gauss_seidel(T, rhs, dx, dy)
    
    nx = size(T,2);
    ny = size(T,1);
    
    T_next = T;
    
    omega = 1.9;
    
    for i=2:nx-1
        for j=2:ny-1
            T_next(i,j) = (1-omega)*T_next(i,j) ...  
                        - omega*(dx^2*dy^2*rhs(i,j) ...
                        - (T(i+1,j)+T_next(i-1,j))*dy^2 ...
                        - (T(i,j+1)+T_next(i,j-1))*dx^2)/2/(dx^2+dy^2);
        end
    end
    
end

