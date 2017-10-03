clear;
close all;

load('maxVolume1.mat')

[P,S] = polyfit(Time, pTorr, 1); 

fig = figure(1);
h1 = plot(Time, pTorr,'x', 'Linewidth', 2);
hold on
e = errorbar(Time, pTorr, stdDev, '.'); 
e.LineWidth = 2.5;
h2 = plot(Time, P(1)*Time + P(2), 'Linewidth', 1.5);


ax = gca;
ax.FontName = 'LaTeX';
ax.TickLabelInterpreter = 'LaTeX';
ax.FontSize = 18;
ax.XColor = 'k';
ax.YColor = 'k';

ax.YLabel.String = ('Pressure(mTorr)');
ax.YLabel.FontSize = 16;
ax.YLabel.FontWeight = 'bold';
ax.YLabel.Color = 'k';

ax.XLabel.String = ('Time (s)');
ax.XLabel.FontSize = 16;
ax.XLabel.FontWeight = 'bold';
ax.XLabel.Color = 'k';

ax.Box = 'off';
ax.LineWidth = 1.5;
%ax.Color = [25, 25, 25]/255;
ax.XLim = [0,30];
ax.YGrid = 'on';
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';

t = title('Pressure of Process Chamber Vs Time');
t.Color = 'k';
t.Interpreter = 'LaTeX';
t.FontSize = 24;