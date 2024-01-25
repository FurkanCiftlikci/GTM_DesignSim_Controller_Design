# GTM_DesignSim_Controller_Design
2023-2024 Istanbul Technical University, Control and Automation Engineering Thesis

##### Description #####
This thesis aims to design a PID (Proportional-Integral-Derivative) controllers for the autonomous landing process of a fixed-wing NASA-GTM aircraft. 

Project contains four folder:

1) gtm_design: Main folder that contains controllers in the Simulink model. 
2) gtm_design_additional: Additional folder that not contains the controllers but additional anaylsis scripts.
3) resources: This folder contains the useful articles and books for research.
4) thesis_documents: It includes the thesis report and presentation.


##### How to set up Flight Gear and connect it to Simulink #####

1) Download the Flight Gear latest version from its website.
2) Launch the Fligt Gear. Click the "Aircraft" from the left. Search for "Boeing 777-300" and install it.
   When you install it open the local directory of the aircraft. You can see the directory from the FlightGear.
   For me it is:
   C:\Users\ciftl\FlightGear\Downloads\Aircraft\org.flightgear.fgaddon.stable_2020\Aircraft

3) Copy the "777" file folder. 

4) From the desktop right click the FlightGear and click "Open File Location"	

5) Open the aircraft directory. For me it is:
   C:\Program Files\FlightGear 2020.3\data\Aircraft
   
6) Paste the "777" file folder into this directory.

7) Rename the file folder as "777-300".

8) Open the MATLAB

9) Run the setup.m file that will open the Simulink file.

10) Click and open the "GEN FG RUN".

11) Change the "FlightGear geometry model name" as "777-300".

12) From the same menu, go to the "File" section. Change "FlightGear" base directory
    with your correct directory. If the directory is same, no need to change.

13) Click Apply and "Generate Script" from the same menu. You can close the menu now.
	If you want to change aircraft, file directory or something else, you need to regenarete script.
	
14) When you generate script, it will appear in "BitirmeProjesi" file folder.

15) Double click on it, then FlightGear will automatically start.

16) Change the Simulink	"Stop Time" as "inf" and run the Simulink.

17) You will see your aircarft in FlightGear as simulation continuing.

--------------------------------------------------------------------------------------