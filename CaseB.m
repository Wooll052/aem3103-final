global CL CD S m g rho	
	S		=	0.017;			% Reference Area, m^2
	AR		=	0.86;			% Wing Aspect Ratio
	e		=	0.9;			% Oswald Efficiency Factor;
	m		=	0.003;			% Mass, kg
	g		=	9.8;			% Gravitational acceleration, m/s^2
	rho		=	1.225;			% Air density at Sea Level, kg/m^3	
	CLa		=	3.141592 * AR/(1 + sqrt(1 + (AR / 2)^2));
							% Lift-Coefficient Slope, per rad
	CDo		=	0.02;			% Zero-Lift Drag Coefficient
	epsilon	=	1 / (3.141592 * e * AR);% Induced Drag Factor	
	CL		=	sqrt(CDo / epsilon);	% CL for Maximum Lift/Drag Ratio
	CD		=	CDo + epsilon * CL^2;	% Corresponding CD
	LDmax	=	CL / CD;			% Maximum Lift/Drag Ratio
	Gam		=	-atan(1 / LDmax);	% Corresponding Flight Path Angle, rad
	V		=	sqrt(2 * m * g /(rho * S * (CL * cos(Gam) - CD * sin(Gam))));
							% Corresponding Velocity, m/s
	Alpha	=	CL / CLa;			% Corresponding Angle of Attack, rad
	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
	H0		=	2*ones(100,1);			% Initial Height, m
	R0		=	0*ones(100,1);	% Initial Range, m

    H       =   2;
    R       =   0;
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	to:6/99:tf;
	xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);
    gamval = zeros(100,1);
    velval = zeros(100,1);


% Define parameters and ranges
numLines = 100;         % Number of lines/trajectories
gammaMin = -0.5;        % Minimum flight path angle (rad)
gammaMax = 0.4;         % Maximum flight path angle (rad)
vMin = 2;               % Minimum initial velocity (m/s)
vMax = 7.5;             % Maximum initial velocity (m/s)
tf = 6;                 % Final time for simulation (s)

% Initialize figure for plotting
figure;
hold on;
xlabel('Range (m)');
ylabel('Height (m)');
title('Range vs. Height for Random Trajectories');

% Loop to simulate and plot multiple trajectories
for i = 1:numLines
    % Generate random values for gamma and initial velocity
    gamma = (gammaMax - gammaMin) * rand + gammaMin;
    V = (vMax - vMin) * rand + vMin;
    
    % Define initial conditions
    H0 = 2;     % Initial height (m)
    R0 = 0;     % Initial range (m)
    xo = [V; gamma; H0; R0];  % Initial state vector [V; gamma; H; R]
    
    % Simulate trajectory using ODE solver
    tspan = [0 tf];  % Time span for simulation
    [~, x] = ode23(@EqMotion, tspan, xo);

    
    % Plot trajectory on the figure
    plot(x(:,4), x(:,3));
end

	%xo = [velval(i);gamval(i);H0;R0];
	%[ti,xi]	=	ode23('EqMotion',tspan,xo);
    
	%figure
	%plot(xi(:,4),xi(:,3),xa(:,4),xa(:,3));
	%xlabel('Range, m'), ylabel('Height, m'), grid

