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
	H		=	2;			% Initial Height, m
	R		=	0;			% Initial Range, m
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	[to tf];
	xo		=	[V;Gam;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);
	
%	b) Different initial gamma
	xo		=	[2;Gam;H;R];
	[tb,xb]	=	ode23('EqMotion',tspan,xo);
    xo		=	[3.55;Gam;H;R];
	[tc,xc]	=	ode23('EqMotion',tspan,xo);
    xo		=	[7.5;Gam;H;R];
	[td,xd]	=	ode23('EqMotion',tspan,xo);

%	c) Different initial velocity
	xo		=	[V;-0.5;H;R];
	[te,xe]	=	ode23('EqMotion',tspan,xo);
    xo		=	[V;-0.18;H;R];
	[tf,xf]	=	ode23('EqMotion',tspan,xo);
    xo		=	[V;0.4;H;R];
	[tg,xg]	=	ode23('EqMotion',tspan,xo);
	
	figure
    subplot(1,2,1)
	plot(xb(:,4),xb(:,3),'r',xc(:,4),xc(:,3),'k',xd(:,4),xd(:,3),'g')
	xlabel('Range, m'), ylabel('Height, m'), grid

    subplot(1,2,2)
    plot(xe(:,4),xe(:,3),'r',xf(:,4),xf(:,3),'k',xg(:,4),xg(:,3),'g')
	xlabel('Range, m'), ylabel('Height, m'), grid


