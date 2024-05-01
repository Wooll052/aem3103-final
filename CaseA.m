%% Case A
[V Gam H R] = setup_sim();
	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
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


