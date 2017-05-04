function div=divergence(unew,vnew,dx,dy)

div=(unew(2:end-1,2:end)-unew(2:end-1,1:end-1))./(dx)+((vnew(2:end,2:end-1)-vnew(1:end-1,2:end-1))./(dy));
end
