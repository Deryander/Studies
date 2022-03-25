model lab7case2
  parameter Real N = 800; // общее число потенциальных покупателей
  parameter Real n0 = 11; //начальное число уже информированных покупателей
  parameter Real a1 = 0.000012; // интенсивность рекламной кампании
  parameter Real a2 = 0.8; // интенсивность сарафанного радио
  
  Real n; // число уже информированных покупателей

initial equation
  n = n0;

equation
  der(n) = (a1 + a2 * n) * (N - n);

end lab7case2;
