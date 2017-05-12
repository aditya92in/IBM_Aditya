% Jacobi 
function [resid] = residual(T, rhs, dx, dy)
    
    nx = size(T,1);
    ny = size(T,2);
    
    resid = zeros(nx,ny);
    
    for i=2:nx-1
        for j=2:ny-1
            resid(i,j) = rhs(i,j) ...
                        -(T(i+1,j)-2*T(i,j)+T(i-1,j))/dx^2 ... 
                        -(T(i,j+1)-2*T(i,j)+T(i,j-1))/dy^2;
        end
    end
    
end



% function [resid] = residual(T, rhs, dx, dy)
%     
%     nx = size(T,1)
%     ny = size(T,2)
%     
% %     resid = zeros(nx,ny);
%     
% %     for i=2:nx-1
% %         for j=2:ny-1
% %             resid(i,j)=rhs(i,j)-(T(i+1,j)-2*T(i,j)+T(i-1,j))/dx^2 -(T(i,j+1)-2*T(i,j)+T(i,j-1))/dy^2;
% %         end
% %     end
%     
% end