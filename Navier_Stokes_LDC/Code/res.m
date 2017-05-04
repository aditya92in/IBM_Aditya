function [e_x,e_y]=res(uold,unew,vold,vnew)
e_x=norm(unew(2:end-1,2:end-1)-uold(2:end-1,2:end-1));
e_y=norm(vnew(2:end-1,2:end-1)-vold(2:end-1,2:end-1));
end