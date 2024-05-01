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
    R_avg = zeros(size(tspan));
    H_avg = zeros(size(tspan));
    figure
    hold on
    grid on

    for i = 1:runs
        Vvalue = Vmin + (Vmax - Vmin)*rand(1);
        GamValue = GamMin + (GamMax - GamMin)*rand(1);
        xo = [Vvalue; GamValue; H; R];
        [tb, xb] = ode23('EqMotion', tspan, xo);
    
        R_avg = R_avg + xb(:, 4)';
        H_avg = H_avg + xb(:, 3)';
    
        plot(xb(:, 4), xb(:, 3))
    end

    R_avg = R_avg / runs;
    H_avg = H_avg / runs;

    plot(R_avg, H_avg, 'k', 'LineWidth', 4)

    xlabel('Range, m'); ylabel('Height, m')

    R_fit = polyfit(tspan, R_avg, 10);
    H_fit = polyfit(tspan, H_avg, 10);

    Requation = sprintf('R = %.7ft^10 + %.7ft^9 + %.7ft^8 + %.7ft^7 + %.7ft^6 + %.7ft^5 + %.7ft^4 + %.7ft^3 + %.7ft^2 + %.7ft + %.7f', R_fit(1), R_fit(2), R_fit(3), R_fit(4), R_fit(5), R_fit(6), R_fit(7), R_fit(8), R_fit(9), R_fit(10), R_fit(11));
    disp(Requation)
    Hequation = sprintf('H = %.7ft^10 + %.7ft^9 + %.7ft^8 + %.7ft^7 + %.7ft^6 + %.7ft^5 + %.7ft^4 + %.7ft^3 + %.7ft^2 + %.7ft + %.7f', H_fit(1), H_fit(2), H_fit(3), H_fit(4), H_fit(5), H_fit(6), H_fit(7), H_fit(8), H_fit(9), H_fit(10), H_fit(11));
    disp(Hequation)