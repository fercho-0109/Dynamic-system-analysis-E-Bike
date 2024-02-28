# Dynamic-system-analysis-of-a-e-Bike

Code developed for "A. Marino, - Receding Horizon Tracking Trajectory Strategy for Feedback Linearized Differential-Drive".  
Master's student "Calabria University".  
For any questions or suggestions write to alexismarino0109@gmail.com

# Sumary.

This repository encapsulates a comprehensive project deeply rooted in the principles of Dynamic System Theory, conducted using MATLAB/Simulink. The central focus revolves around the meticulous mathematical modeling of an electric bike (e-bike), delving into intricate aspects such as its linearity, responses under both free and forced conditions, as well as internal and external stability analyses. Beyond the dynamics, a thorough examination of the structural properties of the e-bike is undertaken, encompassing critical aspects such as reachability and observability.

Furthermore, the project extends its scope to advanced control strategies. A sophisticated Luenberger observer is implemented using MATLAB/Simulink to estimate the unmeasured states of the e-bike system accurately. Complementing this, a state feedback control is devised, harnessing the insights garnered from the dynamic system analyses to optimize the bike's performance.

  
# Prerequisites
- The code was created and tested on the Matlab/Simulink 2023a environment

# File description
The repository contains three files
1. **Electric_Bicycle**: This Matlab file contains the configuration parameters of the program and shows the results of the analysis.
2. **Electric_Bike**: This Simulink file contains the complete simulation of the e-bike system and the implementation of the observer and control.
3. **Report**: This contains the complete explanation, the mathematical formulations, and the control configuration.


# Example to run the experiment  
**"e-BIKE"**
### Matlab/Simulink simulation 
1. Download the files. 
2. Run the Matlab file "**Electric_Bicycle**".
3. Open and run the Simulink file "**Electric_Bike**"
4. The Scope blocks should start to show the results  
![image](https://github.com/fercho-0109/Dynamic-system-analysis-of-a-e-Bike-/assets/40362695/38b221e3-3071-4afd-bd2a-a567903d0a51)  
fig1. In blue is shown the graph of the free response without feedback. On the other hand, the orange graph is the response after feedback control which shows a noticeable reduction of the overshoot that is generated in the beginning


