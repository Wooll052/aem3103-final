 # Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Franklin Woolley, Thomas Herbert

  ## Summary of Findings
  <Show the variations studied in a table>

  In this project, we made various plots to show how a paper plane behaves under different circumstances. The first figure shows how the flight path differs depending on changes made to either the initial velocity or the initial flight path angle. As we can see, the flight paths differ much more with different initial velocities than with different initial flight path angles. The nominal conditions are the same for both subplots, and the result is a straight path. Figure two shows how flight paths vary within the limits of V0(max) and Gam0(max). The average path of all of the paths looks fairly similar to the green plot in the right subplot of Figure 1, where Gam0 is the largest. The third figure shows the change in range and height as a function of time for this average path. Both the change in height and change in range are fairly steady in the middle of the time range. Overall, the paper airplane flies about 20 feet in 6 seconds, no matter how you throw it, as long as there's enough space for it to glide. But if you're launching it from just 2 feet off the ground, it might only go 6 to 15 feet, depending on how you throw it.
 
  # Code Listing
  A list of each function/script and a single-line description of what it does.  The name of the function/script should link to the file in the repository on GitHub.

  # Figures

  ## Fig. 1: Single Parameter Variation
  ![CaseAfigure2ndtry](https://github.com/Wooll052/aem3103-final/assets/167140519/cbc89e0a-386f-422f-8c61-f6504ad4c00c)
  The subplot on the left shows changes in initial velocity and the subplot on the right shows changes in initial flight path angle.


  Range vs. height graphs for initial velocities of 2 (red), 3.55 (black), and 7.5 (green) m/s on the left graph and for initial flight path angles -0.5 (red), -0.18 (black), and 0.4 (green) radians on the right graph. 

  ## Fig. 2: Monte Carlo Simulation
  ![CaseCfigure1st](https://github.com/Wooll052/aem3103-final/assets/167140519/39c20ebf-13cd-4750-9d48-03587183a2bd)


  Range vs. Height graphs for 100 random initial values of flight path angle and velocity (colorful lines), and the polynomial fit line (thick black line). 

 ## Fig. 3: Time Derivatives
 ![CaseD1stder](https://github.com/Wooll052/aem3103-final/assets/167140519/909ddc46-83ea-48f6-996f-6d807f200d7f)


  Time derivatives of Range vs. time (left), and Height vs. time (right) retrieved from polynomial fits. 



  ## Animation
  ![animation](https://github.com/Wooll052/aem3103-final/assets/167140431/c882bd37-2a5f-41eb-bd3e-fa5e74a83163)
  Animated GIF showing 2D trajectory for nominal (in black) and the scenario {V=7.5 m/s, Gam=+0.4 rad} (in red) conditions.
  
