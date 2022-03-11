model lab5case1
  parameter Real a = -0.42; // коэффициент естественного прироста жертв
  parameter Real b = -0.043; // коэффициент смертности жертв
  parameter Real c = -0.44; // коэффициент естественной смертности хищников
  parameter Real d = -0.045; // коэффициент увеличения числа хищников
  
  parameter Real x0 = 4;
  parameter Real y0 = 13;
  
  Real x; // число жертв
  Real y; // число хищников

initial equation
  x = x0;
  y = y0;

equation
  der(x) = a*x - b*x*y;
  der(y) = - c*y + d*x*y;

end lab5case1;
