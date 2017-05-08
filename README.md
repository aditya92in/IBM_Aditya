This code is a first start to implement the Immersed Boundary Method. As a test case, i implement vortex shedding at Reynolds Number 100. I use a Volume of Solid IBM.I use a staggered grid, CDS for spatial gradients, AB2 for time integration of momentum and diffusion. It uses the Pressure Free Projection method of Chorin for Pressure Velocity coupling. An iterative pascal solver (for the poisson equation), ADI is used.

1. Feel Free to write to me , if you find any bugs in the code at aditya92in@gmail.com. If you have any suggestions/ better ways to code, please also write to me. This is a part of my thesis work at TU-Delft. There is LOTS of stuff, that can be done from here. Using, PRESSURE CORRECTION ,as opposed to PRESSURE PROJECTION, converting this to a fully implicit code and Strectched grids is something i certainly expect to do.
I plan to simulate a moving cylinder using this code as well. The code is implemented in MATLAB for now. Later i plan to switch to Fortran.

Updates:

1. Pressure Correction is implemented in Pressure Correction
2. I plan to use collocated grids soon enough, if indexing gets too complicated on deformable boundaries (also one of my test cases for IBM )
3. Upwinding schemes could be used for this as well. That too should be done.
