k=9.4; // Начальное расстояние от лодки до катера
fi=3*%pi/4;

// Функция, описывающая движение катера береговой охраны
function dr=f(tetha, r)
    dr=r/sqrt(12.69);
endfunction

// Начальный условия для 1 случая
r0=k/4.7;
tetha0=0;

tetha=0:0.01:2*%pi;

r=ode(r0,tetha0,tetha,f);

// Функция, описывающая движение лодки браконьеров
function xt=f2(t)
    xt=tan(fi)*t;
endfunction

t=0:1:15;

// Построение графиков
polarplot(tetha,r,style = color('green'));
plot2d(t,f2(t),style = color('red'));
xtitle("Траектория движения катера и лодки")
