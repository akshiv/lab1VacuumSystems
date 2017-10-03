clear;
close all;

load('HeProcessChamber.mat');
load('vacuumBackground.mat');
A = [PTorr1'; PTorr2'];
dev = std(A);

pTorr = (PTorr1 + PTorr2) ./ 2 ;

fig = figure(1);

% fig.Resize = 'off';
% fig.PaperUnits = 'inches';
% fig.Units = 'inches';
% fig.PaperPositionMode = 'manual';
% fig.PaperPosition = [0, 0, 10, 5];
% fig.PaperSize = [10, 10];
% fig.Position = [0.1, 0.1, 9.9, 8.9];

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
ax.YLim = [0 1e-6];
ax.XTick = 0:5:50;
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';

t = title('Relative Partial Pressure Vs Atomic Mass of Gas Species in the Process Chamber with constant He Flow');
t.Color = 'k';
t.Interpreter = 'LaTeX';
t.FontSize = 24;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

backgroundAdjusted = pTorr - vacuumBackground;
fig = figure(2);

% fig.Resize = 'off';
% fig.PaperUnits = 'inches';
% fig.Units = 'inches';
% fig.PaperPositionMode = 'manual';
% fig.PaperPosition = [0, 0, 10, 5];
% fig.PaperSize = [10, 10];
% fig.Position = [0.1, 0.1, 9.9, 8.9];

%fig.Color = [25, 25, 25]/255;
%fig.InvertHardcopy = 'off';

b = bar(Mass1,backgroundAdjusted);
hold on
e = errorbar(Mass1, backgroundAdjusted, dev, '.'); 
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
ax.YLim = [0 1e-6];
ax.XTick = 0:5:50;
ax.XMinorTick = 'on';
ax.YLim = [0 10e-7];
ax.YMinorTick = 'on';

t = title('Relative PP Vs AM in the Process Chamber with constant $He$ Flow, Bckg Subtracted');
t.Color = 'k';
t.Interpreter = 'LaTeX';
t.FontSize = 24;