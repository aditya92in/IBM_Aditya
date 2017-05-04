function [up,vp]=inter_p(unew,vnew)
up=0.5*(unew(2:end-1,2:end)+unew(2:end-1,1:end-1));
vp=0.5*(vnew(2:end,2:end-1)+vnew(1:end-1,2:end-1));
end