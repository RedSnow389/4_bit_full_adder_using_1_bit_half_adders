`timescale 1ns/1ns

module HalfAdder(sum,carry,A,B);
    input A,B;
    output sum,carry;

    not #1 (A1,A);
    not #1 (B1,B);
    and #1 (t1,A1,B);
    and #1 (t2,B1,A);
    or #1 (sum,t1,t2);
    and #1 (carry,A,B);

endmodule

module FA(sum,cout,cin,A,B);
    input A,B,cin;
    output sum,cout;

    HalfAdder a(sum1,c1,cin,A);
    HalfAdder b(sum,c2,sum1,B);
    HalfAdder c(cout,c3,c1,c2);

endmodule

module RCA(sum,cout,A,B,cin);
    input [3:0]A;
    input [3:0]B;
    input cin;
    output [3:0]sum;
    output cout;

    FA p(sum[0],c1,cin,A[0],B[0]);
    FA q(sum[1],c2,c1,A[1],B[1]);
    FA r(sum[2],c3,c2,A[2],B[2]);
    FA s(sum[3],cout,c3,A[3],B[3]);

endmodule
