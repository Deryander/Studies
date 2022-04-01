model lab8case1
  parameter Real p_cr = 45; // критическая стоимость продукта
  parameter Real tau1 = 25; // длительность производственного цикла фирмы 1
  parameter Real p1 = 10;   // себестоимость продукта у фирмы 1
  parameter Real tau2 = 20; // длительность производственного цикла фирмы 2
  parameter Real p2 = 7.7;  // себестоимость продукта у фирмы 2
  parameter Real N = 70;    // число потребителей производимого продукта
  parameter Real q = 1;     // максимальная потребность одного человека в продукте в единицу времени
  
  parameter Real a1 = p_cr / (tau1*tau1 * p1*p1 * N * q);
  parameter Real a2 = p_cr / (tau2*tau2 * p2*p2 * N * q);
  parameter Real b = p_cr / (tau1*tau1 * tau2*tau2 * p1*p1 * p2*p2 * N * q);
  parameter Real c1 = (p_cr - p1) / (tau1 * p1);
  parameter Real c2 = (p_cr - p2) / (tau2 * p2);
  
  parameter Real M1_0 = 7;
  parameter Real M2_0 = 8;
  
  Real M1;    // оборотные средства фирмы 1
  Real M2;    // оборотные средства фирмы 2
  Real tetha; // безразмерное время

initial equation
  M1 = M1_0;
  M2 = M2_0;

equation
  time = c1 * tetha;
  der(M1) = M1 - (b / c1) * M1 * M2 - (a1 / c1) * M1*M1;
  der(M2) = (c2 / c1) * M2 - (b / c1) * M1 * M2 - (a2 / c1) * M2*M2;
  
end lab8case1;
