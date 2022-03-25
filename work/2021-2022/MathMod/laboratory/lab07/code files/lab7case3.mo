model lab7case3
  parameter Real N = 800; // общее число потенциальных покупателей
  parameter Real n0 = 11; //начальное число уже информированных покупателей
  Real a1; // интенсивность рекламной кампании
  Real a2; // интенсивность сарафанного радио
  
  Real n; // число уже информированных покупателей

initial equation
  n = n0;

equation
  a1 = 0.1 * sin(time);
  a2 = 0.1 * cos(10 * time);
  der(n) = (a1 + a2 * n) * (N - n);

end lab7case3;
