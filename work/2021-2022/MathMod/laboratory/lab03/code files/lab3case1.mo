model lab3case1
  parameter Real a = 0.21; // степень влияния различных факторов на потери x
  parameter Real b = 0.74; // эффективность боевых действий со стороны y
  parameter Real c = 0.68; // эффективность боевых действий со стороны x
  parameter Real h = 0.19; // степень влияния различных факторов на потери y
  
  parameter Real x0 = 20500;  // численность армии x в нач. момент времени
  parameter Real y0 = 21500;  // численность армии y в нач. момент времени
  
  Real x;
  Real y;
  
  // возможность подхода подкрепления к войскам в течение дня:
  // для войск x: sin(time) + 0.5
  // для войск y: cos(time) + 0.5

initial equation
  x = x0;
  y = y0;

equation
  der(x) = -a*x -b*y + sin(time) + 0.5;
  der(y) = -c*x -h*y + cos(time) + 0.5;

end lab3case1;
