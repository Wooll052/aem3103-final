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


    Requation = sprintf('R = %.5ft^12 + %.5ft^11 + %.5ft^10 + %.2ft^9 + %.2ft^8 + %.2ft^7 + %.2ft^6 + %.2ft^5 + %.2ft^4 + %.2ft^3 + %.2ft^2 + %.2ft + %.2f', R_fit(1), R_fit(2), R_fit(3), R_fit(4), R_fit(5), R_fit(6), R_fit(7), R_fit(8), R_fit(9), R_fit(10), R_fit(11), R_fit(12), R_fit(13));
    disp(Requation)
    Hequation = sprintf('H = %.5ft^12 + %.5ft^11 + %.5ft^10 + %.2ft^9 + %.2ft^8 + %.2ft^7 + %.2ft^6 + %.2ft^5 + %.2ft^4 + %.2ft^3 + %.2ft^2 + %.2ft + %.2f', H_fit(1), H_fit(2), H_fit(3), H_fit(4), H_fit(5), H_fit(6), H_fit(7), H_fit(8), H_fit(9), H_fit(10), H_fit(11), H_fit(12), H_fit(13));
    disp(Hequation)