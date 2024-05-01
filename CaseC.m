%% Case C
[V Gam H R] = setup_sim();
	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	to:(6/99):tf;
	xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);
	
%	b) Effect of random change in initial velocity and initial AoA
    runs = 100;
    Vmax = 7.5; Vmin = 2; GamMax = 0.4; GamMin = -0.5;
    for i = 1:runs
        Vvalue = Vmin + (Vmax - Vmin)*rand(1);
        GamValue = GamMin + (GamMax - GamMin)*rand(1);
        xo = [Vvalue;GamValue;H;R];
        [tb,xb]	=	ode23('EqMotion',tspan,xo);
    end
    
    R = xb(:, 4);
    H = xb(:, 3);
    R_fit = polyfit(tspan, R, 12);
    H_fit = polyfit(tspan, H, 12);

    figure
    hold on
    %plot(tspan, R, '.')
    %plot(tspan, H, '.')

    Requation = sprintf('R = %.5fx^12 + %.5fx^11 + %.5fx^10 + %.2fx^9 + %.2fx^8 + %.2fx^7 + %.2fx^6 + %.2fx^5 + %.2fx^4 + %.2fx^3 + %.2fx^2 + %.2fx + %.2f', R_fit(1), R_fit(2), R_fit(3), R_fit(4), R_fit(5), R_fit(6), R_fit(7), R_fit(8), R_fit(9), R_fit(10), R_fit(11), R_fit(12), R_fit(13));
    disp(Requation)
    Hequation = sprintf('H = %.5fx^12 + %.5fx^11 + %.5fx^10 + %.2fx^9 + %.2fx^8 + %.2fx^7 + %.2fx^6 + %.2fx^5 + %.2fx^4 + %.2fx^3 + %.2fx^2 + %.2fx + %.2f', H_fit(1), H_fit(2), H_fit(3), H_fit(4), H_fit(5), H_fit(6), H_fit(7), H_fit(8), H_fit(9), H_fit(10), H_fit(11), H_fit(12), H_fit(13));
    disp(Hequation)
    

