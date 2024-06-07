`timescale 1ns/1ns

module FA_tb;
    reg A_tb,B_tb,cin_tb;
    wire sum_tb,cout_tb;

    FA dut(.sum(sum_tb),.cout(cout_tb),.cin(cin_tb),.A(A_tb),.B(B_tb));

    initial begin
        A_tb = 0;
        B_tb = 0;
        cin_tb = 0;

        $dumpfile("adder_tb.vcd");
        $dumpvars(0, FA_tb);

        #80 $finish;
    end

    /* Generation of input patterns to simulate the UUT */
    // a, b and c will got through all possible combinations
    always
        #10 A_tb = ~A_tb;
    always
        #20 B_tb = ~B_tb;
    always
        #40 cin_tb = ~cin_tb;

endmodule

module RCA_tb;
    reg [3:0]a_tb;
    reg [3:0]b_tb;
    reg c_tb;
    wire [3:0]s_tb;
    wire c1_tb;

    RCA dut(.sum(s_tb),.cout(c1_tb),.A(a_tb),.B(b_tb),.cin(c_tb));

    initial begin
        $dumpfile("RCA_tb.vcd");
        $dumpvars(0, RCA_tb);

        a_tb[0]=1;
        a_tb[1]=1;
        a_tb[2]=1;
        a_tb[3]=1;
        b_tb[0]=0;
        b_tb[1]=0;
        b_tb[2]=0;
        b_tb[3]=0;
        c_tb=1;

        #20;

        a_tb[0]=0;
        a_tb[1]=0;
        a_tb[2]=0;
        a_tb[3]=0;
        b_tb[0]=0;
        b_tb[1]=0;
        b_tb[2]=0;
        b_tb[3]=1;
        c_tb=0;

        #80 $finish;
    end  

endmodule

/*
   EXERCISES

   2. Compile the whole design (voter module and test bench) with the following
      command:

        $ iverilog voter.v voter_tb.v

      Note that the module 'test' in 'voter_tb.v' uses the module 'voter'
      defined in 'voter.v'. The Verilog compilar automatically sorts out
      the dependencies between modules provided that it is given the files
      containing all the needed modules. The compiled design is written to
      file 'a.out'.

   3. Simulate the design with:

        $ vvp a.out

   4. Take a look to the simulation results with:

        $ gtkwave voter_tb.vcd &

   5. Check that the circuit results are correct, that is, that signal 'f' is
      '1' only when two or more inputs are '1'. If it is not the case, revisit
      the design in file 'voter.v', make the necessary corrections and simulate
      again until the result is correct.

      Note: You do not need to exit Gtkwave between simulation runs, jus use
      the option "File->Reload Waveform" or press "Shift+Ctrl+R" to reload the
      new results.
*/