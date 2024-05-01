%% Case D
[V Gam H R] = setup_sim();
	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	to:(6/99):tf;
t = tspan;

H = @(t) 0.0003576*t.^10 + -0.0114839*t.^9 + 0.1577038*t.^8 + -1.2070877*t.^7 + 5.6208214*t.^6 + -16.2841712*t.^5 + 28.7090785*t.^4 + -28.5054262*t.^3 + 13.0438800*t.^2 + -1.7337762*t + 2.0472403;
R = @(t) 0.0003086*t.^10 + -0.0089794*t.^9 + 0.1094264*t.^8 + -0.7202230*t.^7 + 2.7364426*t.^6 + -5.8368930*t.^5 + 5.7371377*t.^4 + 0.4542041*t.^3 + -4.8885883*t.^2 + 5.3527208*t + -0.0244304;

dhdt = @(t) 0.003576*t.^9 + -0.1033551*t.^8 + 1.2616304*t.^7 + -8.4496139*t.^6 + 33.724928*t.^5 + -81.420856*t.^4 + 114.836314*t.^3 + -85.5162786*t.^2 + 26.08776*t + -1.7337762;
drdt = @(t) 0.003086*t.^9 + -0.0808146*t.^8 + 0.8754112*t.^7 + -5.0415610*t.^6 + 16.418656*t.^5 + -29.184465*t.^4 + 22.9485508*t.^3 + 1.3626123*t.^2 + -9.7771766*t + 5.3527208;

figure
hold on
subplot(1,2,1)
plot(t, R(t),'r')
xlabel('Time, s'), ylabel('Range, m'), grid

subplot(1,2,2)
plot(t, H(t),'b')
xlabel('Time, s'), ylabel('Height, m'), grid

figure
hold on
subplot(1,2,1)
plot(t, drdt(t),'r')
xlabel('Time, s'), ylabel('Change in Range'), grid

subplot(1,2,2)
plot(t, dhdt(t),'b')
xlabel('Time, s'), ylabel('Change in Height'), grid

