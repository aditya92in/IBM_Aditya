function [du_e,du_w,du_s,du_n]=viscous_coeff(uold,dx,dy)
du_e=(uold(2:end-1,3:end)-uold(2:end-1,2:end-1))/(dx);
du_w=(uold(2:end-1,2:end-1)-uold(2:end-1,2:end-1))/(dx);
du_s=(uold(2:end-1,2:end-1)-uold(1:end-2,2:end-1))/(dy);
du_n=(uold(3:end,2:end-1)-uold(2:end-1,2:end-1))/(dy);
end