#Modelling the COVID-19 outbreak in Sri Lanka 
#with Ordinary Differential Equations and Machine Learning

#########Linear Regression on Recovered Cases################

#Author : Ranitha Mataraarachchi [ranitha@ieee.org]
#Date   : 16.03.2020 


clear ; close all; clc

#Load Data
data = load('data.txt');

#Active infectives I(t)
I = data(:, 2);

#Total cases reported 
T = data(:,1);

days = length(T);

#Recovered cases R(t)
for i = 1:days
      R(i) = T(i)-I(i);
    endfor

#New Recovered cases (Rate of change of R(t))
    
    for i = 1:(days-1)
      Rdot(i) = R(i+1)-R(i);
    endfor

I = I(2:end,:);
Rdot = Rdot';

% Plot Data

plot(I,Rdot,'rx','MarkerSize',12);
ylabel('Rate of change of R(t)');
xlabel('Total Cases');

#There is only one parameter changing (beta-gamma)
theta = 0;

% Some gradient descent settings
iterations = 150000;
alpha = 0.0001;

% run gradient descent
m = length(Rdot); % number of training examples


for iter = 1:iterations

A = I'*(I*theta-Rdot);
B = (A*alpha)/m;
theta = theta - B;
end

fprintf('(beta-gamma) found by gradient descent:\n');
fprintf('%f\n', theta);

% Plot the linear fit
hold on; % keep previous plot visible
p1 = plot(I(:,1), I*theta, '-');
set(gca,'FontSize',18);
set(p1,'LineWidth',2);
grid on;
legend('Actual', 'Best Fit','location','northwest')
title('Rate of change of R(t) with respect to I(t)');
hold off % don't overlay any more plots on this figure

