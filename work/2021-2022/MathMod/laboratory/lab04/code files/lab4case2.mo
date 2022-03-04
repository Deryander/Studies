model lab4case2
  parameter Real g = 0.2; // потери энергии
  parameter Real w = sqrt(0.4); //собственная частота колебаний
  
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
  der(y) = -2*g*y -w*w*x;

end lab4case2;
