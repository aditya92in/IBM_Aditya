# Navier_Stokes_a1
This is my first start for coding the Navier Stokes Equations on a Staggered Grid. Most of the codes found in google are spaghetti, and very difficult to read. This repo thus, can be used as a starting point, (also for myself).Having said that ,people who have already built their NS ,can also look for bugs in this code. This is a part of my thesis on IBM, for which the first step is building your own working,robust, NS Solver. Feel free to ping me at aditya92in@gmail.com

This is a finite Volume Navier Stokes code, which uses CDS for spatial gradients everywhere, and AB2 for time integration of the momentum and viscous terms. Like i said, this is a first start. Better schemes can be put into this. The code itself can be made implicit, and other stuff. All this, i hope to follow soon, if time permits, and my thesis schedules permit.



Boundary Conditions for LDC
 
-Top Boundary (u=1,v=0,p=0)     Left (u=0 v =0, dp/dx=0)   Right Boundary (u=0, v=0,dp/dx=0) 
     BOTTOM (u=0 v =0, dp/dy=0)    
                 _ __ ____________bottom________________________________   
                |                                                 |                         |y axis
                |                                                 |                         | 
                |                                                 |                         | 
                |                                                 |                         |____________________x axis
                |_ _____________________________________________  |
-               Left            top (du/dy=0 v=0, dp/dy=0)     Right
+                           
 
 L_x= length of the domain in x direction
 L_y=length of the domain in y direction
-Note, that i use matlab convention. 
+Note, that i use matlab convention. so u(imax,jmax) in cartesian coordinates is u(y,x). 
+Also note,
+the y coordinate increases in the downward direction. AS per MATLAB.
+the x coordinate increases as we move towards right.
+
 So imax---> no of INTERIOR grid points in y direction
 jmax---> no of INTERIOR grid points in x direction
 Note, that its a staggered grid.
 The execution starts from the main.m file
