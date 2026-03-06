# **Active Noise Cancellation 🔇 ** 

---
---
---
## A brief background on Active Noise Cancellation (ANC): 

Over the past decade, many companies have developed practical applications to 
block out noise pollutions for different scenarios in everyday life. Whether 
it's specific to a system such as a car cabin

<img src = "assets/carANC.png" width ="300"> 



a cockpit in an aircraft

<img src = "assets/cockpitANC.png" width ="300"> 





or usage for everyday life, like being in the office.

<img src = "assets/speedANC.png" width ="300"> 


ANC is a technique that uses destructive interface to cancel out unwanted noise signals. It's specifically a **ADAPTIVE** learning algorithm that is employed to quickly learn the characteristics of the unwanted signal in real time. 

Below is a picture of how ANC works 

<img src = "assets/ANCCancel.png" width ="300"> 



Below is a visual representation of how they combine 

![ANC Filter Animation](assets/gojoPurple.gif)
 



---
---
---

## Project Overview: 

## Table of Contents 📖 : 
* [LMS Background] (#LMS Background) 
* [LMS Math] LMS Math 
* [FxLMS vs LMS] FxLMS vs LMS 
* [FxLMS System Overview] FxLMS System Overview 
* [FxLMS Results] FxLMS Results 

This github is used as a personal documentation to help explain the math and usage of the 
Least Mean Squares(LMS) Algorithm used as well as later diving into different algorithms simulated in Matlab 2024A. 

This first portion will just be simulation in Matlab 2024A for post processing data. The noise generated will be 
simulated in Matlab as well. 

The second portion would be the attempt at the hardware for ANC, and will be linked at the top of the ReadMe file (if i get to it). 

Now lets dive into the fun. 

## LMS Background 

The Least Mean Squares algorithm is a widely used **adaptive** filter technique that updates filter coefficients iteratively to minimize the **MEAN SQUARE ERROR** between a desired signal and actual output. 

It specifically uses **STOCHASTIC GRADIENT DESCENT** method to efficiently adapt to real-time signals, making it ideal for this specific application. 

Stochoastic means that the results is randomly determined, aka having a random probability distribution pattern that is not able to be predicted precisely. Think of the stock market, weather patterns, and traffic congestions. 

<img src = "assets/stonksMeme.png" width ="300"> 


The opposite of stochoastic is deterministic, meaning that every event, output, or action is strictly determined, leaving no room for chance or randomness. Think of calculators, traffic lights, etc. 

<img src = "assets/67Calc.png" width ="300"> 



