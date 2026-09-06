//=======================================================================
// Mathematical system function/tasks
//=======================================================================

1.log10(value)
module top;
int a;
initial begin
a=3;
$display("a=%f",$log10(a));
end
endmodule
OUTPUT:
# a=0.477121


2.ln(value)
module top;
int a;
initial begin
a=3;
$display("a=%f",$ln(a));
end
endmodule
OUTPUT:
# a=1.098612

3.$exp(value)
module top;
int a;
initial begin
a=3;
$display("a=%f",$exp(a));
end
endmodule
OUTPUT:
# a=20.085537

4.$sqrt(value)
module top;
int a;
initial begin
a=3;
$display("a=%f",$sqrt(a));
end
endmodule
OUTPUT:
# a=1.732051

5.$pow(x,y)
module top;
int a,b;
initial begin
a=3;//base
b=2;//power
$display("power=%0d",$pow(a,b));
end
endmodule
OUTPUT:
# power=9


6.floor(value)
module top;
int a,b;
initial begin
a=3.3;
b=-3.5;
$display("floor=%f",$floor(a));
$display("floor=%f",$floor(b));
end
endmodule
OUTPUT:
# floor=3.000000
# floor=-4.000000

7.ceil(value)
module top;
int a,b;
initial begin
a=3.4;
b=-3.4;
$display("ceil=%f",$ceil(a));
$display("ceil=%f",$ceil(b));
end
endmodule
OUTPUT:
# ceil=3.000000
# ceil=-3.000000


8.$sin(value),$cos(value),$tan(value),$asin(value),$acos(value),$atan(x,y)
module top;
real a, b;
initial begin

    a = 3.0;
    b = 4.5;

    $display("sin  = %f", $sin(a));
    $display("cos  = %f", $cos(b));
    $display("tan  = %f", $tan(a));

    $display("asin = %f", $asin(0.5));
    $display("acos = %f", $acos(0.5));
    $display("atan = %f", $atan(a));
    $display("atan2 = %f", $atan2(a, b));

end
endmodule
OUTPUT:
# sin  = 0.141120
# cos  = -0.210796
# tan  = -0.142547
# asin = 0.523599
# acos = 1.047198
# atan = 1.249046
# atan2 = 0.588003


























