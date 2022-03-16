model lab6case2
  parameter Real a = 0.01; // коэффициент заболеваемости
  parameter Real b = 0.02; // коэффициент выздоровления
  parameter Real n = 20000; //общее число особей
  
  parameter Real i0 = 99;
  parameter Real r0 = 5;
  parameter Real s0 = n - i0 - r0;
  
  Real i; // восприимчивые к болезни, но здоровые особи
  Real r; // инфицированные особи, являющиеся распространителями инфекции
  Real s; // здоровые особи с иммунитетом

initial equation
  i = i0;
  r = r0;
  s = s0;

// i(0) > i*
equation
  der(s) = - a*s;
  der(i) = a*s - b*i;
  der(r) = b*i;

end lab6case2;
