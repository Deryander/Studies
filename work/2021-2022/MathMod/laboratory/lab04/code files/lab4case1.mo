model lab4case1
  parameter Real g = 0; // потери энергии
  parameter Real w = sqrt(0.6); //собственная частота колебаний
  
  // значения начальных условий:
  parameter Real x0 = 0.4;
  parameter Real y0 = 2.1;
  
  Real x;
  Real y;

initial equation
  x = x0;
  y = y0;

equation
  der(x) = y;
  der(y) = -w*w*x;

end lab4case1;
