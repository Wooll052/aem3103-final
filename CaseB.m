%% Case B
[V Gam H R] = setup_sim();
	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	to:(6/99):tf;
	xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);
	
%	b) Effect of Increased Initial Velocity
    runs = 100;
    Vmax = 7.5; Vmin = 2; GamMax = 0.4; GamMin = -0.5;
    figure
    hold on
    for i = 1:runs
        Vvalue = Vmin + (Vmax - Vmin)*rand(1);
        GamValue = GamMin + (GamMax - GamMin)*rand(1);
        xo = [Vvalue;GamValue;H;R];
        [tb,xb]	=	ode23('EqMotion',tspan,xo);
        plot(xb(:,4),xb(:,3))
    end
    xlabel('Range, m'), ylabel('Height, m'), grid


