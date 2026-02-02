# Cubesat_CoppeliaSim

Attitude control is a key subsystem in any space mission, enabling the orientation and stabilization of a satellite according to its operational requirements in observation, communication, or navigation. Among the various available methods, reaction wheels provide an efficient and widely adopted solution for small and medium-sized satellites. Their operation relies on the principle of conservation of angular momentum: by accelerating or decelerating a wheel, a torque is generated that changes the satellite’s orientation.

Related to “Physics and Space Instrumentation” undergraduate grade of the Universidad de Alcalá, a didactic model of an attitude control system based on reaction wheels has been developed using the simulation environment CoppeliaSim. This tool allows for the realistic recreation of a satellite’s dynamics and the interaction between its components, making it easier for students to grasp the physical and mathematical principles underlying attitude control.

The model includes three orthogonally mounted reaction wheels, providing full three-axis control of the satellite’s attitude. A proportional-derivative (PD) control scheme is implemented to adjust wheel speeds in response to simulated angular deviations, effectively reproducing the dynamic behavior of a real system. Moreover, the interactive 3D visualization provided by CoppeliaSim enables students to explore different operational scenarios and assess the performance of various control strategies.

This repository has been designed as a complement to the article included in it, "", facilitating the reproduction and extension of the results.
As mentioned, the CoppeliaSim model serves as a didactic tool for students, so the approach is gamifying the attitude control concepts. For this reason, three different games are set out: 
* **Joystick control**: first level to make first contact with the model and learn how to interact with it. Free movement of the joints through the joystick.
* **Detumbling**: divided into two levels of difficulty. The goal of the game is detumbling the satellite, meaning to eliminate the default unwanted angular velocity. First it is possible to see the target velocity you are setting with the joystick, but the 3rd level of difficulty consists on trying to detumbling the satellite only with watching at the 3D model, unknowing the velocity. 
* **Light search control**: once you have mastered detumbling, the final level is to orient the satellite facing Sun. This means to search the light point with the camara sensor integrated in the satellite. Instead of using joystick, keyboard will be used in this level to move the reaction wheels. 

The repository structure is the following:
* Detumbling folder: includes the CoppeliaSim model, along with the Python script needed to connect CoppeliaSim with joystick. This files include joystick control and detumbling exercises. 
* Light search folder: for the last game, a new CoppeliaSim model has been designed, adding the light, camara sensor, and changing the interface control from joystick to keyboard.

For detailed operation instructions for each game, read the article "" included in the repository. 

# Instalation guide and advices
CoppeliaSim is needed to open the 3D model. It has been developed with the educational licence, available to download in https://www.coppeliarobotics.com/ . 

For the Python script to detect the joystick signals, it is necessary to have the dialog box running in the foreground. 



