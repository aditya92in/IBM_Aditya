function dummy=grid_plotting(x_c,y_c,x_c1,y_c1,imax,jmax,x,y,r1,r2)


% for i=1:jmax+2 %jmax+2 (number of pressure nodes, including ghost) + jmax+1 (plus number of u-velocity nodes)
%     for j=1:imax+2 %imax+2 (number of pressure nodes, including ghost)+ imax+1 (plus number of v-velocity nodes) 
%         plot(x(j,i),y(j,i),'k.','MarkerSize',10);
%         hold all
%     end
% end

% hold on
% a=[0 0];
% b=[0 1];
% plot(a,b,'b--');
% a=[0 1];
% b=[1 1];
% hold on
% plot(a,b,'b--');
% a=[1 1];
% b=[1 0];
% plot(a,b,'b--');
% a=[1 0];
% b=[0 0];
% plot(a,b,'b--');




% plotting points for u
%  for i=2:2:2*(jmax)+3  %outer loop traverses across x (the index name 'i' does not matter)
%       for j=1:2:(2*imax)+3 %inner loop traverses across y
%           plot(x(j,i),y(j,i),'x','MarkerSize',10);
%           hold all
%       end
%   end
%  plotting points for v
%  for i=1:2:(2*jmax)+3
%      for j=2:2:(2*imax)+3
%          plot(x(j,i),y(j,i),'o','MarkerSize',10);
%          hold all
%      end
% end

circle(x_c,y_c,r1);
hold on
circle(x_c1,y_c1,r2);

end