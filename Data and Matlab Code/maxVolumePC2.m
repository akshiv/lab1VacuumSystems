clear;
close all;

load('maxVolume2.mat')

m = length(pTorr);
risingCurve  = [];
fallingCurve = [];

for i=188:264
    if( pTorr(i) > 108 && pTorr(i) < 118)
        risingCurve(end+1) = pTorr(i);
    end
end

%% Fit: 'Rising Fit 1'.
[xData, yData] = prepareCurveData( [], risingCurve );

% Set up fittype and options.
ft = fittype( '-e*exp(-b*x)+c*exp(-b*x)+e', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.917695471683786 0.269119426398556 0.547870901214845];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', '5V Filling Curve' );
h1 = plot( fitresult, xData, yData );
hold on
e = errorbar(xData,yData, stdDevError1, '.');
e.LineWidth = 2;
legend( h1, 'risingCurve', 'Rising Fit 1', 'Location', 'NorthEast' );
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

ax.XLabel.String = ('Time(s)');
ax.XLabel.FontSize = 16;
ax.XLabel.FontWeight = 'bold';
ax.XLabel.Color = 'k';

ax.Box = 'off';
ax.LineWidth = 1.5;
ax.YGrid = 'on';
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';

t = title('5V Filling Curve');
t.Color = 'k';
t.Interpreter = 'LaTeX';
t.FontSize = 24;

for i=264:337
    if( pTorr(i) > 108 && pTorr(i) < 118)
        fallingCurve(end+1) = pTorr(i);
    end
end

%% Fit: 'Falling Curve 1'.
[xData, yData] = prepareCurveData( [], fallingCurve );

% Set up fittype and options.
ft = fittype( 'a*exp(b*x)+c*exp(-b*x)+a', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.108584216221285 0.500416776870409 0.750371987242018];

% Fit model to data.
[fitresult2, gof2] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', '4.5V Draining Curve' );
h2 = plot( fitresult2, xData, yData );
hold on
e = errorbar(xData,yData,stdDevError2, '.');
e.LineWidth = 2;
legend( h2, 'fallingCurve', 'Falling Curve 1', 'Location', 'NorthEast' );
% Label axes
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

ax.XLabel.String = ('Time(s)');
ax.XLabel.FontSize = 16;
ax.XLabel.FontWeight = 'bold';
ax.XLabel.Color = 'k';

ax.Box = 'off';
ax.LineWidth = 1.5;
ax.YGrid = 'on';
ax.XMinorTick = 'on';
ax.YMinorTick = 'on';

t = title('4.5V Draining Curve');
t.Color = 'k';
t.Interpreter = 'LaTeX';
t.FontSize = 24;
