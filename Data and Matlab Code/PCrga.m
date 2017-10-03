clear;
close all;

load('PCChamberRga.mat');
A = [PTorr'; PTorr1'; PTorr2'; PTorr3'];
dev = std(A);
pTorr = (PTorr + PTorr1 + PTorr2 + PTorr3) ./ 4 ;

fig = figure(1);

% fig.Resize = 'off';
fig.PaperUnits = 'inches';
fig.Units = 'inches';
% fig.PaperPositionMode = 'manual';
fig.PaperSize = [11, 8.5];
% fig.Position = [0.1, 0.1, 11, 8.5];

%fig.Color = [25, 25, 25]/255;
%fig.InvertHardcopy = 'off';

b = bar(Mass1,pTorr);
hold on
e = errorbar(Mass1, pTorr, dev, '.'); 
e.LineWidth = 2;

ax = gca;
ax.FontName = 'LaTeX';
ax.TickLabelInterpreter = 'LaTeX';
ax.FontSize = 18;
ax.XColor = 'k';
ax.YColor = 'k';

ax.YLabel.String = ('Partial Pressure(Torr)');
ax.YLabel.FontSize = 16;
ax.YLabel.FontWeight = 'bold';
ax.YLabel.Color = 'k';

ax.XLabel.String = ('Atomic Mass (amu)');
ax.XLabel.FontSize = 16;
ax.XLabel.FontWeight = 'bold';
ax.XLabel.Color = 'k';

ax.Box = 'off';
ax.LineWidth = 1.5;
%ax.Color = [25, 25, 25]/255;
ax.YGrid = 'on';
ax.XLim = [0 50];
ax.XTick = 0:5:50;
ax.YLim = [0, 14e-7];
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';

t = title('Relative Partial Pressure Vs Atomic Mass of Gas Species in the Process Chamber');
t.Color = 'k';
t.Interpreter = 'LaTeX';
t.FontSize = 24;