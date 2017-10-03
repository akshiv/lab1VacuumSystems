clear;
close all;

load('PumpingSpeed.mat');

x = [time5V time45V time4V time35V time3V time25V time2V time15V time1V time05V];

y = [chamberPressure5V chamberPressure45V chamberPressure4V chamberPressure35V chamberPressure3V chamberPressure25V chamberPressure2V chamberPressure15V chamberPressure1V chamberPressure05V];

Flow = [N2Flow5V N2Flow45V N2Flow4V N2Flow35V N2Flow3V N2Flow25V N2Flow2V N2Flow15V N2Flow1V N2Flow05V];
[n, m] = size(y);

for i = 1:100
    for j = 1:10
        y(i,j)= NaN;
    end
end

for i = 1:50
    for j = 1:10
        Flow(i,j)= NaN;
    end
end

for i = 140:152
    for j = 1:10
        Flow(i,j)= NaN;
    end
end

%% Fit: '5V-Fit'.
[xData, yData] = prepareCurveData( time5V, chamberPressure5V );

% Set up fittype and options.
ft = fittype( 'c*exp(-(b*x))-d*exp(-e*x)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.697064557083522 0.322338117458438 0.54972360829114 0.91719366382981];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'Fits' );
hold on
h1 = plot( fitresult, 'k', xData, yData, excludedPoints);
ax = gca;
ax.LineWidth = 2;


%% Fit: '4.5V-Fit'.
[xData, yData] = prepareCurveData( time45V, chamberPressure45V );

% Set up fittype and options.
ft = fittype( 'c*exp((b*x))-d*exp(e*x)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5 143 144 145 146 147 148 149 150 151 152] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.469390641058206 0.0119020695012414 0.337122644398882 0.162182308193243];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
%figure( 'Name', '4.5V-Fit' );
h2 = plot( fitresult, xData, yData, excludedPoints );


%% Fit: '4V-Fit'.
[xData, yData] = prepareCurveData( time4V, chamberPressure4V );

% Set up fittype and options.
ft = fittype( 'c*exp(-(b*x))-d*exp(-e*x)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.567821640725221 0.0758542895630636 0.0539501186666071 0.530797553008973];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
%figure( 'Name', '4V-Fit' );
h3 = plot( fitresult, xData, yData, excludedPoints );


%% Fit: '3.5V-Fit'.
[xData, yData] = prepareCurveData( time35V, chamberPressure35V );

% Set up fittype and options.
ft = fittype( 'c*exp(-(b*x))-d*exp(-e*x)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.567821640725221 0.0758542895630636 0.0539501186666071 0.530797553008973];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
%figure( 'Name', '3.5V-Fit' );
h4 = plot( fitresult, xData, yData, excludedPoints );

%% Fit: '3V-Fit'.
[xData, yData] = prepareCurveData( time3V, chamberPressure3V );

% Set up fittype and options.
ft = fittype( 'c*exp(-(b*x))-d*exp(-e*x)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5 6] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.567821640725221 0.0758542895630636 0.0539501186666071 0.530797553008973];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
%figure( 'Name', '3V-Fit' );
h5 = plot( fitresult, xData, yData, excludedPoints );


%% Fit: '2.5V-Fit'.
[xData, yData] = prepareCurveData( time25V, chamberPressure25V );

% Set up fittype and options.
ft = fittype( 'c*exp((-b*x))-d*exp(-e*x)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5 6] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.91333736150167 0.152378018969223 0.825816977489547 0.538342435260057];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
%figure( 'Name', '2.5V-Fit' );
h6 = plot( fitresult, xData, yData, excludedPoints );

%% Fit: '2V-Fit'.
[xData, yData] = prepareCurveData( time2V, chamberPressure2V );

% Set up fittype and options.
ft = fittype( 'c*exp((-b*x))-d*exp(-e*x)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5 6 7 8] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.91333736150167 0.152378018969223 0.825816977489547 0.538342435260057];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
%figure( 'Name', '2V-Fit' );
h7 = plot( fitresult, xData, yData, excludedPoints );


%% Fit: '1.5V-Fit'.
[xData, yData] = prepareCurveData( time15V, chamberPressure15V );

% Set up fittype and options.
ft = fittype( 'c*exp((-b*x))-d*exp(-e*x)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5 6 7 8 9 10 11] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.961898080855054 0.00463422413406744 0.774910464711502 0.817303220653433];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
%figure( 'Name', '1.5V-Fit' );
h8 = plot( fitresult, xData, yData, excludedPoints );


%% Fit: '1V-Fit'.
[xData, yData] = prepareCurveData( time1V, chamberPressure1V );

% Set up fittype and options.
ft = fittype( 'c*exp((b*x))-d*exp(e*x)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.0759666916908419 0.239916153553658 0.123318934835166 0.183907788282417];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
%figure( 'Name', '1V-Fit' );
h9 = plot( fitresult, xData, yData, excludedPoints );


%% Fit: '0.5V-Fit'.
[xData, yData] = prepareCurveData( time05V, chamberPressure05V );

% Set up fittype and options.
ft = fittype( 'c*exp((-b*x))-d*exp(-e*x)+c', 'independent', 'x', 'dependent', 'y' );
excludedPoints = excludedata( xData, yData, 'Indices', [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 123 124 125 126 127 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152] );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.57970458736557 0.549860201836332 0.144954798223727 0.853031117721894];
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
%figure( 'Name', '0.5V-Fit' );
h10 = plot( fitresult, xData, yData, excludedPoints );
% Label axes
xlabel 'Time'
ylabel 'Chamber Pressure'
grid on

t = title('Pumping Speed vs Time, Varying Driving Voltage');
t.Color = 'k';
t.Interpreter = 'LaTeX';
t.FontSize = 24;
%legend( 'chamberPressure05V vs. time05V', 'Excluded chamberPressure05V vs. time05V', '0.5V-Fit', 'Location', 'NorthEast' );
h = findobj(gca,'Type','line');
%legend([h1 h2 h3 h4 h5 h6 h7 h8 h9 h10],{'5V', '4.5V','4V','3.5V','3V', '2.5V','2V','1.5V','1V', '0.5'});