# Modelling the COVID-19 outbreak in Sri Lanka, forecasting the trends and steps to be taken to stop further spread.

[octave-5.1.0] <br>
Originally Published On:  17/03/2020 <br>
Last Updated:             17/03/2020 <br>

## Introduction

COVID-19 or 2019-nCoV is a novel (not seen before) coronavirus believed to be transferred to humans through bats. An outbreak of pneumonia of unknown reason was first reported on 31st December 2019 from Wuhan City in Hubei Province of China. On 7th Jan 2020, it was diagnosed as “Novel Corona Virus”. On 30th Jan 2020, World Health Organization has declared it as a Public Health Emergency of International Concern (PHEIC). On 11/02/2020 the WHO has introduced a short form for the diseases as COVID-19 and on 11/03/2020 declared as **pandemic**. (source: http://www.epid.gov.lk/)
An alarming number of cases have been reported within the first week of the outbreak in Sri Lanka and many of the reported cases have been imported directly from Italy where the disease has its second-highest number of reported cases. 

The readme file of this repository has been divided into three parts.
  1. How to model an epidemic disease using ordinary differential equations.
  2. Modelling the current situation in Sri Lanka. (Will be updated routinely until the epidemic situation diminishes)
  3. Comments. (Will be updated routinely until the epidemic situation diminishes)

**What is discussed in this repository is solely the author's point of view and the information may be different from the real situation.**

**All the data has been copied directly from the website of Epidemiology Unit of the Ministry of Health, Sri Lanka (http://www.epid.gov.lk/).**


## 1. How to model an epidemic disease using ordinary differential equations.

Epidemic diseases can be modelled using ordinary differential equations in several ways. The most common model is the **SIR** model. It assumes that the population size is fixed (i.e., no births, deaths due to disease, or deaths by natural causes), incubation period of the infectious agent is instantaneous, and duration of infectivity is same as length of the disease. It also assumes a completely homogeneous population with no age, spatial, or social structure.

![SIR](https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/SIR.PNG/600px-SIR.PNG) Image: Wikipedia

The total population is believed to be a constant as epidemics tend to have shorter time frames and thus the population variation can be negligible. This total population is then divided into three parts.
  1. Susceptibles - *S(t)*
  2. Infectives   - *I(t)*
  3. Recovered or Reduced      - *R(t)*
  
  The susceptibles are the fraction of population who are susceptible to the disease. In our case, the total population is susceptible with no age, gender or social differences. 
  The infectives are the fraction of population who are know to be confirmed cases of COVID-19. 
  The reduced people, in this case, are the people who have recovered from or perished due to the disease. 
  Note that *S(t), I(t), R(t)* vary with time.
  
  #### *S(t)*
  
 In the case of an epidemic, the susceptible number of people drops at any given time. This is due to people falling sick. For the disease to spread a person from the infected group *I(t)* must come in contact with a person from the susceptible group *S(t)*. Thus the rate of susceptible people falling sick is proportional to *I(t)* and *S(t)*. It is also proportional to some proportionality constant   ![equation](https://latex.codecogs.com/png.latex?\beta) called the transmission coefficient. Now the rate of change of *S(t)* is given by, <br><br>
 ![a](https://latex.codecogs.com/png.latex?\dot{S(t)}=-\beta&space;S(t)I(t)) <br><br>
 But, the dimensions of the rate of change of Susceptibles with time should be *people/time*. Therefore, to match the dimensions this rate should be divided by *N*, the total population. Note the minus sign is to imply the number of susceptibles drop over time. <br><br>
 ![a](https://latex.codecogs.com/png.latex?\dot{S(t)}=\frac{-\beta&space;S(t)I(t)}{N}) <br><br>
 
 
  #### *I(t)*
  
  In an epidemic, the number of infectives rise up exponentially and then rises linearly for a while before coming to a maximum while exhibiting logarithmic rise. Afterwards, the infectives decay to zero. Refer the image at the bottom of the section. The rate of change of *I(t)* is governed by two factors, the rate of susceptibles turning into infectives and the rate of infectives turning into recovered or simply, dying. 
  The rate of infectives turning into reduced group solely depends on the number of infectives and hence it is proportional to *I(t)* along with a proportionality constant ![a](https://latex.codecogs.com/png.latex?\gamma) called the recovery rate. Now the rate of change of infectives is given by,
  
  ![a](https://latex.codecogs.com/png.latex?\dot{I(t)}&space;=&space;\frac{\beta&space;S(t)I(t)}{N}&space;-&space;\gamma&space;I(t))
  
  
  #### *R(t)*
  
  The rate of recovery can be extracted from the above equation to be,
  
  ![a](https://latex.codecogs.com/png.latex?\dot{R(t)}&space;=&space;\gamma&space;I(t))
  
  Note that the sum of *S(t) + I(t) + R(t)* is *N*.
  
  And the sum ![a](https://latex.codecogs.com/png.latex?\dot{S}(t)&plus;\dot{I}(t)&plus;\dot{R}(t)) is *0*.
  
  This means that the rate of change of *N*, population, with time is zero. The population is constant. (The reason behind assuming the population to be constant is because epidemics emerge and decay in a short time span and the population change is unnoticeable).
  
  By studying these 3 ordinary differential equations one can analyze and predict the future events of an epidemic. This system of quations is nonlinear and by solving the resultant functions *S(t), I(t), R(t)* can be plotted as below (minimum noise conditions),
  
  ![a](https://www.researchgate.net/profile/C_Macal/publication/224209140/figure/fig1/AS:302881765904406@1449224048529/Typical-SIR-model-solution-showing-progression-of-population-disease-states-for.png) Image: ResearchGate
  
  
  
  
  
  
  ## 2. Modelling the current situation in Sri Lanka.
  
  
  
