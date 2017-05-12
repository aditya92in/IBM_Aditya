function [x_c,y_c]=move_cyl(x_c,y_c,a,dx,dy,k)

if (fix(a)>=5) && (fix(a)<10) || ((fix(a)>=15) && (fix (a)<20)) || (fix((a)>=25) && (fix(a)<30)) || (fix((a)>=35)&&(fix(a)<40)) ||...
       (fix(a)>=45) && (fix (a)<50)||(fix(a)>=55) && (fix (a)<60) || (fix(a)>=65) && (fix (a)<70)...
       || (fix(a) >=75)&&(fix(a)<80) || (fix(a)>=85)&&(fix(a)<90) || (fix(a)>=95)&&(fix(a)<100)||(fix(a)>=105)&&(fix(a)<110)...
       ||(fix(a)>=115)&&(fix(a)<120)||(fix(a)>=125)&&(fix(a)<130)||(fix(a)>=135)&&(fix(a)<140)
y_c=y_c+(0.01)*dy;
else
    if(fix(a)>=10)&&(fix(a)<15) || ((fix(a)>=20) && fix(a)< 25) || ((fix(a)>=30) &&(fix(a)<35))...
            || (fix((a)>=40)&&(fix(a)<45)) ||...
       (fix(a)>=50) && (fix (a)<55)||(fix(a)>=60) && (fix (a)<65) || (fix(a)>=70) && (fix (a)<75)...
       || (fix(a)>=80)&&(fix(a)<85)|| (fix(a)>=90)&&(fix(a)<95) || (fix(a)>=100)&&(fix(a)<105)...
       || (fix(a)>=110)&&(fix(a)<115)|| (fix(a)>=120)&&(fix(a)<125) || (fix(a)>=130)&&(fix(a)<135)
        y_c=y_c-(0.01)*dy;
    end
    
end

% a=fix(a);
% if(mod(a,4)==0)&&(a~=4)
%     k=a./4;
%     k=k+1;
% end
% if(a>(k*4) && (a<(k+1)*4))
%     if(mod(k,2)==0)
%         y_c=y_c-(0.01)*dy;
%     else
%         y_c=y_c+(0.01)*dy;
%     end
% end



end