function [p_x,p_y]=inter_pre(pnew)
p_x=(pnew(2:end-1,1:end-1)+pnew(2:end-1,2:end))*0.5;
p_y=(pnew(1:end-1,2:end-1)+pnew(2:end,2:end-1))*0.5;
end