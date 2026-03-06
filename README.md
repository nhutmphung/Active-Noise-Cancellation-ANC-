# Active Noise Cancellation using Filtered Adaptive Algorithm 

---
## A brief background on Active Noise Cancellation (ANC): 

Over the past decade, many companies have developed practical applications to 
block out noise pollutions for different scenarios in everyday life. Whether 
it's specific to a system such as a car cabin

<img src = "assets/carANC.png" width ="500"> 

a cockpit in an aircraft
<img src = "assets/cockpitANC.png" width ="500"> 

or usage for everyday life, like being in the office.
<img src = "assets/speedANC.png" width ="500"> 


ANC is something we use without knowing (think of airpod/headphone noise cancellation). 
By leveraging adaptive signal processing algorithm, ANC, is implemented on a high performance 
digital signals processing(DSP) board. 
---
## Project Overview: 

This github is used as a personal documentation to help explain the math and usage of the 
Least Mean Squares(LMS) Algorithm used as well as later diving into different algorithms simulated in Matlab 2024A. 

This first portion will just be simulation in Matlab 2024A for post processing data. The noise generated will be 
simulated in Matlab as well. 

The second portion would be the attempt at the hardware for ANC, and will be linked at the top of the ReadMe file (if i get to it). 

Now lets dive into the math. 

