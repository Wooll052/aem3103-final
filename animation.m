%% Animation
[V Gam H R] = setup_sim();
	
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	[to:tf/99:tf];
    y0      =   [3.55;-0.18;H;R];
    [t0,x0]	=	ode23('EqMotion',tspan,y0);
	y1		=	[7.5;0.4;H;R];
	[t1,x1]	=	ode23('EqMotion',tspan,y1);

% Initialize figure and axes
figure;
axis([0 22 -2 4]); 
xlabel('Range, m'), ylabel('Height, m'), grid
hold on

% Plot initial points with specified display names
plot(NaN, NaN, 'k.', 'DisplayName', 'Nominal');
plot(NaN, NaN, 'r.', 'DisplayName', '7.5 m/s, 0.4 rad');

% Preallocate the frames cell array to store each frame
frames = cell(1, 100);

for i = 1:100
    plot(x0(i,4), x0(i,3), 'k.')
    plot(x1(i,4), x1(i,3), 'r.')

    if i > 1
        plot([x0(i-1,4) x0(i,4)], [x0(i-1,3) x0(i,3)], 'k')
        plot([x1(i-1,4) x1(i,4)], [x1(i-1,3) x1(i,3)], 'r')
    end
    
    % Update the plot
    drawnow;
    pause(0.1);
    
    % Capture the current frame and store it
    frames{i} = getframe(gcf);
end

% Create the GIF
filename = 'animation.gif';
for i = 1:length(frames)
    im = frame2im(frames{i});
    [imind, cm] = rgb2ind(im, 256);
    if i == 1
        imwrite(imind, cm, filename, 'gif', 'Loopcount', inf, 'DelayTime', 0.1);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.1);
    end
end

    
