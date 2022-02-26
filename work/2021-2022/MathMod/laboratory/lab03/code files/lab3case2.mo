model lab3case2
  parameter Real a = 0.09; // степень влияния различных факторов на потери x
  parameter Real b = 0.79; // эффективность боевых действий со стороны y
  parameter Real c = 0.62; // эффективность боевых действий со стороны x
  parameter Real h = 0.11; // степень влияния различных факторов на потери y
  
  parameter Real x0 = 20500;  // численность армии x в нач. момент времени
  parameter Real y0 = 21500;  // численность армии y в нач. момент времени
  
  Real x;
  Real y;
  
  // возможность подхода подкрепления к войскам в течение дня:
  // для войск x: sin(2 * time)
  // для войск y: cos(2 * time)

initial equation
  x = x0;
  y = y0;

equation
  der(x) = -a*x -b*y + sin(2 * time);
  der(y) = -c*x*y -h*y + cos(2 * time);

end lab3case2;
