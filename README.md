 # Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Franklin Woolley, Thomas Herbert

  ## Summary of Findings
  <Show the variations studied in a table>

  In this project, we made various plots to show how a paper plane behaves under different circumstances. The first figure shows how the flight path differs depending on changes made to either the initial velocity or the initial flight path angle. As we can see, the flight paths differ much more with different initial velocities than with different initial flight path angles. The nominal conditions are the same for both subplots, and the result is a straight path. Figure two shows how flight paths vary within the limits of V0(max) and Gam0(max). The average path of all of the paths looks fairly similar to the green plot in the right subplot of Figure 1, where Gam0 is the largest. The third figure shows the change in range and height as a function of time for this average path. Both the change in height and change in range are fairly steady in the middle of the time range. Overall, the paper airplane flies about 20 feet in 6 seconds, no matter how you throw it, as long as there's enough space for it to glide. But if you're launching it from just 2 feet off the ground, it might only go 6 to 15 feet, depending on how you throw it.
 
  # Code Listing
  [Equation of Motion](https://github.com/Wooll052/aem3103-final/blob/main/EqMotion.m) : Creates an array that contains range and height data points as a function of time using the initial velocities and flight path angles provided. 
  
  [Paper Plane](https://github.com/Wooll052/aem3103-final/blob/main/PaperPlane.m) : Creates a flight path plot for 4 different conditions, then creates a velocity vs. time graph,  a flight path angle vs. time graph, an altittude vs. time graph, and a range vs. time graph for the 4 different conditions. 
  
  [Setup Simulation](https://github.com/Wooll052/aem3103-final/blob/main/setup_sim.m) : Provides the setup code required for ploting the flight path data to unclutter the other scripts. 
   
  [Case A](https://github.com/Wooll052/aem3103-final/blob/main/CaseA.m) : Gives a flight path graph for three different initial velocities and three different initial flight path angles. 
  
  [Case B](https://github.com/Wooll052/aem3103-final/blob/main/CaseB.m) : Gives 100 flight paths using 100 random initial velocities and flight path angles. 
  
  [Case C](https://github.com/Wooll052/aem3103-final/blob/main/CaseC.m) : Finds a polynomial fit for the average flight path of the 100 random ones in Case B and plots it over the graph from Case B. Also finds the tenth order polynomial equations for range vs. time and height vs. time. 
  
  [Case D](https://github.com/Wooll052/aem3103-final/blob/main/CaseC.m) : Plots the range vs. time and height vs. time equations from Case C on two graphs, then plots their derivatives on two more graphs. 
  
  [Animation](https://github.com/Wooll052/aem3103-final/blob/main/animation.m) : Creates an animated gif of flight two flight paths with varying initial conditions. 

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
  
