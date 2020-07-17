Cmod A7-35T XADC Demo
==============
  
Description
--------------
This project is a Vivado demo using the Cmod A7-35T's analog-to-digital converter ciruitry, push buttons and the RGB LED, written in Verilog. When programmed onto the board, voltage levels between 0 and 1 Volts are read off of the JXADC header. The RGB LEDs brightness increases as the voltage increases. When BTN1 is pressed, the demo switches the xadc channel 4 to channel 12 that is connected to pin 15 and 16 respectively. See the Cmod A7-35T's [Reference Manual](https://reference.digilentinc.com/reference/programmable-logic/cmod-a7/reference-manual) for more information about how the Artix 7 FPGA's XADC is connected to header JXADC.


  
Requirements
--------------
* **Cmod A7-35T**: To purchase a Cmod A7-35T, see the [Digilent Store](https://store.digilentinc.com/cmod-a7-breadboardable-artix-7-fpga-module/)
* **Vivado 2020.1 Installation**: To set up Vivado, see the [Installing Vivado and Digilent Board Files Tutorial](https://reference.digilentinc.com/vivado/installing-vivado/start).
* **MicroUSB Cable**
* **Wires and a Circuit to Measure**

Demo Setup
--------------
1. Download and extract the most recent release ZIP archive from this repository's [Releases Page](https://github.com/Digilent/Cmod-A7-35T-XADC/releases).
2. Open the project in Vivado 2020.1 by double clicking on the included XPR file found at "\<archive extracted location\>/vivado_proj/Cmod-A7-35T-XADC.xpr".
3. In the Flow Navigator panel on the left side of the Vivado window, click **Open Hardware Manager**.
4. Plug the Cmod A7-35T into the computer using a MicroUSB cable.
5. In the green bar at the top of the window, click **Open target**. Select "Auto connect" from the drop down menu.
6. In the green bar at the top of the window, click **Program device**.
7. In the Program Device Wizard, enter "\<archive extracted location\>vivado_proj/Cmod-A7-35T-XADC.runs/impl_1/XADCdemo.bit" into the "Bitstream file" field. Then click **Program**.
8. The demo will now be programmed onto the Cmod A7-35T. See the Introduction section of this README for a description of how this demo works.

Next Steps
--------------
This demo can be used as a basis for other projects, either by adding sources included in the demo's release to those projects, or by modifying the sources in the release project.

Check out the Cmod A7-35T's [Resource Center](https://reference.digilentinc.com/reference/programmable-logic/cmod-a7/start) to find more documentation, demos, and tutorials.

For technical support or questions, please post on the [Digilent Forum](https://forum.digilentinc.com).

Additional Notes
--------------
For more information on how this project is version controlled, refer to the [Digilent Vivado Scripts Repository](https://github.com/digilent/digilent-vivado-scripts)

