clear;
close all;

load('pumpSpeedVsPressure.mat');
To = To(1); k = k(1);

devCP = [0.3057    0.1726    0.1578    0.1958    0.1777    0.1977    0.1847    0.1522   0.1324    0.1861];
devFR = [0.0159    0.0175    0.0235    0.0398    0.0357    0.0414    0.0275    0.0196   0.0084    0.0052];

devCP = devCP/2;
devFR = devFR/2;

P = polyfit(FlowRate, ChamberPressure, 1);

fig = figure(1);
h1 = plot(FlowRate, ChamberPressure,'o', 'MarkerSize', 6);
e  = errorbar(FlowRate, ChamberPressure, devCP, devCP, devFR, devFR, 'o');
hold on
e.LineWidth = 1.5;
h2 = plot(FlowRate, P(1)*FlowRate + P(2), 'Linewidth', 1.5);

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

ax.XLabel.String = ('Mass Flow Rate (cm^3/s)');
ax.XLabel.FontSize = 16;
ax.XLabel.FontWeight = 'bold';
ax.XLabel.Color = 'k';

ax.Box = 'off';
ax.LineWidth = 1.5;
%ax.Color = [25, 25, 25]/255;
ax.YGrid = 'on';
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';

t = title('SS Chamber Pressure vs. SMFR');
t.Color = 'k';
t.Interpreter = 'LaTeX';
t.FontSize = 24;