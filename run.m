
%{
Main application to run the code 


Usage:
Execute the script here to run simulations and evaluate the different ANC algorithms
Adjust the parameters and modes 
Ensure the required data files are abilable before runnign the script 

initialize settings 

%}

clear, clc
addpath(genpath('src'));
rng('default')

%run app
app = gui; 
