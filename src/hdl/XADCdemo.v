`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Samuel Lowe
// 
// Create Date: 4/14/2016
// Design Name: Cmod A7 Xadc reference project 
// Module Name: XADC
// Target Devices: Digilent Cmod A7 15t rev. B
// Tool Versions: Vivado 2015.4
// Description: Demo that will take input from a button to decide which xadc channel to drive a pwm'd led
// Dependencies: 
// 
// Revision:  
// Revision 0.01 - File Created
// Additional Comments: 
//               
// 
//////////////////////////////////////////////////////////////////////////////////
 

module XADCdemo(
    input sysclk,
    input btn0,
    input vp_in,
    input vn_in,
    output [3:0] data_out,
    output led,
    output led_g,
    output led_b,
    output pio,
    input [1:0] xa_n,
    input [1:0] xa_p
 );
   
    //XADC signals
    wire enable;                     //enable into the xadc to continuosly get data out
    reg [6:0] Address_in = 7'h14;    //Adress of register in XADC drp corresponding to data
    wire ready;                      //XADC port that declares when data is ready to be taken
    wire [15:0] data;                //XADC data   
    
    
    reg [32:0] decimal;              //Shifted data to convert to digits
  
   
    ///////////////////////////////////////////////////////////////////
    //XADC Instantiation
    //////////////////////////////////////////////////////////////////
    
    xadc_wiz_0  XLXI_7 (.daddr_in(Address_in), 
                     .dclk_in(sysclk), 
                     .den_in(enable), 
                     .di_in(0), 
                     .dwe_in(0), 
                     .busy_out(),                    
                     .vauxp12(xa_p[1]),
                     .vauxn12(xa_n[1]),
                     .vauxp4(xa_p[0]),
                     .vauxn4(xa_n[0]),               
                     .do_out(data), 
                     .vp_in(vp_in),
                     .vn_in(vn_in),
                     .eoc_out(enable),
                     .channel_out(),
                     .drdy_out(ready));
                     
      //xadc block needs a 100 MHz clk
    wire clk;

                                  
    ///////////////////////////////////////////////////////////////////
    //Address Handling Controlled by button
    //////////////////////////////////////////////////////////////////      
    
    always @(negedge(ready)) begin      
        
        case(btn0)
            1'b1: begin //pressed
                Address_in <= 8'h1c; 
            end    
            1'b0: begin //not pressed
                Address_in <= 8'h14;
            end
            default: Address_in <= 8'h14;
        endcase  
    end 
      
    ///////////////////////////////////////////////////////////////////
    //LED PWM
    //////////////////////////////////////////////////////////////////  
           
    integer pwm_end = 4070;      
    wire [11:0] shifted_data;
    //filter out tiny noisy part of signal to achieve zero at ground
    assign shifted_data = (data >> 4) & 12'hff0;
    
    integer pwm_count = 0;
    reg pwm_out = 0;
   

    //Pwm the data to show the voltage level
    always @(posedge(sysclk))begin
        if(pwm_count < pwm_end)begin
            pwm_count = pwm_count+1;
        end           
        else begin
            pwm_count=0;
        end
    end
    //ledrgb is active low
    assign led = !(pwm_count < shifted_data ? 1'b1 : 1'b0);
    assign leg_g = 0;
    assign leg_b = 0;
    assign pio = led;
    assign data_out [3:0] = shifted_data[11:8];
       
endmodule
