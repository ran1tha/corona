#Modelling the COVID-19 outbreak in Sri Lanka 
#with Ordinary Differential Equations and Machine Learning

################Plotting Various Data#######################

#Author : Ranitha Mataraarachchi [ranitha@ieee.org]
#Date   : 16.03.2020 

clc;
clear all;
close all;
    
    #Load Data - Update only this file
    data = load('data.txt');
    
    
    
    t_cases = data(:,1);  #Total cases
    a_cases = data(:,2);  #Active cases
    
    #Plot total cases
    figure;
    p1 = plot(t_cases);
    grid on;
    set(gca,'FontSize',18);
    set(p1,'LineWidth',2);
    xlabel('Days');ylabel('Total Cases'); 
    title('Total Confirmed COVID-19 cases in Sri Lanka');
    
    
    #Plot active cases
    figure;
    p2 = plot(a_cases);
    grid on;
    set(gca,'FontSize',18);
    set(p2,'LineWidth',2);
    xlabel('Days');ylabel('Total Active Cases'); 
    title('Total active COVID-19 cases in Sri Lanka');
    
    
    #Plot New Cases
    days = length(a_cases);
    
    for i = 1:(days-1)
      new_cases(i) = a_cases(i+1)-a_cases(i);
    endfor
    
    figure;
    p3 = plot(new_cases);
    grid on;
    set(gca,'FontSize',18);
    set(p3,'LineWidth',2); 
    xlabel('Days');ylabel('New Cases');
    title('New cases vs Days');
    
    
    #Plot the Growth Factor (Additional)
    
    for i = 1:(days-1)
      t_new_cases(i) = t_cases(i+1)-t_cases(i);
    endfor
    
    
    for j = 1:(days-2)
      if t_new_cases(j)==0;
        gf(j) = 0;
      else
        gf(j) = t_new_cases(j+1)/t_new_cases(j);
      endif
    endfor
    
    figure;
    p4 = plot(gf);
    grid on;
    set(gca,'FontSize',18);
    set(p4,'LineWidth',2); 
    xlabel('Days');ylabel('Growth Factor');
    title('Growth Factor vs Days');
    
    
    #Plot recovered cases
    for k = 1:days
      r_cases(k) = t_cases(k)-a_cases(k);
    endfor

    figure;
    p4 = plot(r_cases);
    grid on;
    set(gca,'FontSize',18);
    set(p4,'LineWidth',2); 
    xlabel('Days');ylabel('Recovered Cases (including deaths)');
    title('Recovered cases vs Days');